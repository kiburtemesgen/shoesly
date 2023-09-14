import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/core/colors.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/core/widgets/error_page.dart';
import 'package:prior_soft/data/models/product_model.dart';
import 'package:prior_soft/injector.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_bloc.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_event.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_state.dart';
import 'package:prior_soft/presentation/product_detail_page.dart';
import 'package:prior_soft/presentation/widgets/cart_icon.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final brandsList = ['All', 'Nike', 'Jordan', 'Adidas', 'Reebok', 'Puma'];

  int brandIndex = 0;

  @override
  void initState() {
    super.initState();

    sl<GetProductsBloc>().add(GetProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          height: 45,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), color: Colors.black),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            customText(
                text: 'FILTER',
                fontWeight: FontWeight.w600,
                color: Colors.white)
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: kPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: 'Discover',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    cartIcon(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: _brandsWidget(context),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(child: BlocBuilder<GetProductsBloc, GetProductsState>(
                builder: (context, state) {
                  return state is GetProductsLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state is GetProductsError
                          ? ErrorPage(onRetry: () {})
                          : state is GetProductsSuccess
                              ? CustomScrollView(
                                  primary: false,
                                  slivers: <Widget>[
                                    SliverPadding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      sliver: SliverGrid.count(
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          crossAxisCount: 2,
                                          childAspectRatio: 5 / 7,
                                          children: List.generate(
                                              state.products.length,
                                              (index) => Container(
                                                    child: _itemWidget(
                                                        state.products[index],
                                                        context),
                                                  )).toList()),
                                    ),
                                  ],
                                )
                              : const SizedBox();
                },
              )
                  //     child: CustomScrollView(
                  //   primary: false,
                  //   slivers: <Widget>[
                  //     SliverPadding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       sliver: ,
                  //     ),
                  //   ],
                  // )
                  )
            ],
          ),
        ),
      ),
    );
  }

  Widget _brandsWidget(BuildContext context) {
    return SizedBox(
      height: 25,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: brandsList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    brandIndex = index;
                  });
                },
                child: customText(
                    text: brandsList[index],
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: brandIndex == index ? Colors.black : Colors.grey),
              ),
            );
          }),
    );
  }

  Widget _itemWidget(ProductModel product, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetailPage(product: product,))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: size.width * 0.4,
                    decoration: BoxDecoration(
                        color: ColorConst.greyPrimary,
                        image: DecorationImage(
                            image: NetworkImage(product.image[0]),
                            fit: BoxFit.cover)),
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.network(
                          product.brandImage),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          customText(
              text: product.name,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
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
                text: '(${product.reviews.length} reviews)',
                fontSize: 11,
                color: const Color.fromRGBO(183, 183, 183, 1),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          customText(
              text: '\$${product.price}',
              fontSize: 14,
              fontWeight: FontWeight.w800),
        ],
      ),
    );
  }
}
