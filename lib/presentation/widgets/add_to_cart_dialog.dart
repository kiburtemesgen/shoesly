import 'package:flutter/material.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/widgets/common_fab.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/data/models/cart_model.dart';
import 'package:prior_soft/data/models/product_model.dart';
import 'package:prior_soft/injector.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:prior_soft/presentation/screens/cart_page.dart';

class AddToCartDialog extends StatefulWidget {
  const AddToCartDialog(
      {super.key,
      required this.product,
      required this.selectedSize,
      required this.selectedColor});
  final ProductModel product;
  final int selectedSize;
  final String selectedColor;

  @override
  State<AddToCartDialog> createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  TextEditingController quantityController = TextEditingController(text: '1');
  bool isAddedToCart = false;
  @override
  Widget build(BuildContext context) {
    return isAddedToCart
        ? _addedToCartDialog()
        : _addToCartDialog(widget.product);
  }

  Widget _addToCartDialog(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            height: 4,
            width: 35,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(kPadding, 10.0, kPadding, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                  text: 'Add To Cart',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: kPadding),
          child: customText(
              text: 'Quantity', fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: quantityController,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        var quantity = int.tryParse(quantityController.text);
                        if (quantity != null) {
                          if (quantity > 1) {
                            quantity--;
                            quantityController.text = quantity.toString();
                          }
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      setState(() {
                        var quantity = int.tryParse(quantityController.text);
                        if (quantity != null) {
                          quantity++;
                          quantityController.text = quantity.toString();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        commonFAB(isAddedToCart ? "ADDED" : 'ADD TO CART', 'Total Price', () {
          if (int.tryParse(quantityController.text) != null) {
            sl<CartBloc>().add(AddToCart(
                cart: CartModel(
                    product: widget.product,
                    quantity: int.parse(quantityController.text),
                    color: widget.selectedColor,
                    size: widget.selectedSize)));
            setState(() {
              isAddedToCart = true;
            });
          }
        }, product.price, context)
      ],
    );
  }

  Widget _addedToCartDialog() {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 60,
          ),
          customText(
              text: 'Added To Cart', fontSize: 22, fontWeight: FontWeight.bold),
          const SizedBox(
            height: 15.0,
          ),
          customText(
              text: '${quantityController.text} items total',
              color: Colors.grey),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: customText(
                        text: 'BACK EXPLORE', fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: customText(
                        text: 'TO CART',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
