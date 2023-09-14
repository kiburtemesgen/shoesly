import 'package:flutter/material.dart';
import 'package:prior_soft/core/colors.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/utils/get_color_from_string.dart';
import 'package:prior_soft/core/widgets/common_appbar.dart';
import 'package:prior_soft/core/widgets/common_fab.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/data/models/product_model.dart';
import 'package:prior_soft/data/models/review_model.dart';
import 'package:prior_soft/presentation/widgets/add_to_cart_dialog.dart';
import 'package:prior_soft/presentation/widgets/cart_icon.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late int selectedSize;
  late String selectedColor;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product.sizes.first;
    selectedColor = widget.product.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: commonFAB('ADD TO CART', 'Price', () {
        _showAddToCartDialog(context);
      }, widget.product.price, context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: commonAppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [cartIcon()]),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: size.width,
                    height: size.width * 0.85,
                    color: ColorConst.greyPrimary,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConst.greyPrimary,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.product.image.first),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: _detailImageColor(widget.product.colors)),
                        Positioned(
                            bottom: 20, left: 10, child: _detailImageList()),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: customText(
                    text: widget.product.name,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    customText(
                      text: '4.4',
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    customText(
                      text: '(${widget.product.reviews.length} reviews)',
                      fontSize: 11,
                      color: const Color.fromRGBO(183, 183, 183, 1),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: customText(
                    text: 'Size', fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                      itemCount: widget.product.sizes.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _showSizeItem(
                            widget.product.sizes[index].toString(),
                            index == widget.product.sizes.indexOf(selectedSize),
                            index);
                      }),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: customText(
                    text: 'Description',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: customText(text: widget.product.description),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: customText(
                    text: 'Review(${widget.product.reviews.length})',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.product.reviews.length,
                itemBuilder: (context, index) {
                  return _reviewItem(widget.product.reviews[index]);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 0.5, color: Colors.grey)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: customText(
                        text: 'SEE ALL REVIEWS', fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              Container(
                width: size.width,
                height: 30,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorConst.whitePrimary,
                      ColorConst.whiteSecondary
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailImageList() {
    return SizedBox(
      height: 5,
      width: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            3,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: index == 0 ? Colors.black : Colors.grey,
                        borderRadius: BorderRadius.circular(180)),
                    width: 5,
                    height: 5,
                  ),
                )),
      ),
    );
  }

  Widget _detailImageColor(List<String> colors) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 20,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: colors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        selectedColor = colors[index];
                      });
                    },
                    child: _colorItem(
                        getColorFromString(colors[index]),
                        colors.indexOf(selectedColor) == index,
                        colors[index].toLowerCase() == 'white'));
              }),
        ),
      ),
    );
  }

  Widget _colorItem(Color color, bool isSelected, bool isWhite) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.50),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(180),
            border: Border.all(width: 1, color: Colors.grey)),
        child: isSelected
            ? Center(
                child: Icon(
                Icons.check,
                color: isWhite ? Colors.black : Colors.white,
                size: 15,
              ))
            : const SizedBox(),
      ),
    );
  }

  Widget _showSizeItem(String text, bool isSelected, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedSize = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(180),
              border: Border.all(width: 0.4, color: Colors.grey)),
          child: Center(
              child: customText(
                  text: text,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black)),
        ),
      ),
    );
  }

  Widget _reviewItem(ReviewModel review) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(180),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.network(
                review.userPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        text: review.userName,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                    customText(
                        text: 'Today',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                customText(text: review.description)
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showAddToCartDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
                child: AddToCartDialog(
                  product: widget.product,
                  selectedColor: selectedColor,
                  selectedSize: selectedSize,
                )),
          ),
        );
      },
    );
  }
}
