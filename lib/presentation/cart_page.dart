import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/widgets/common_appbar.dart';
import 'package:prior_soft/core/widgets/common_fab.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/data/models/cart_model.dart';
import 'package:prior_soft/injector.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_state.dart';
import 'package:prior_soft/presentation/order_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double getTotal(List<CartModel> carts) {
      double total = 0;
      for (var cart in carts) {
        total += cart.quantity * cart.product.price;
      }
      return total;
    }

    return Scaffold(
        floatingActionButton: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return commonFAB('CHECKOUT', 'Grand Total', () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OrderPage()));
            }, getTotal(state.carts), context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: commonAppBar(
          title: 'Cart',
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_sharp)),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.carts.length,
                  itemBuilder: (context, index) {
                    return _cartItem(state.carts[index], index);
                  },
                );
              },
            )
          ],
        )));
  }

  Widget _cartItem(CartModel cart, int index) {
    return Dismissible(
      key: Key(cart.product.id),
      background: Container(
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        sl<CartBloc>().add(RemoveFromCart(index: index));
      },
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: 0.5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 1,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(cart.product.image.first),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        text: cart.product.name,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    customText(
                        text: '${cart.product.name} ${cart.color} ${cart.size}',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(text: '\$${cart.product.price}'),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  sl<CartBloc>()
                                      .add(DecreaseQuantity(index: index));
                                },
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 25,
                                  color: Colors.grey,
                                )),
                            const SizedBox(
                              width: 7,
                            ),
                            customText(
                                text: cart.quantity.toString(),
                                fontWeight: FontWeight.bold),
                            const SizedBox(
                              width: 7,
                            ),
                            IconButton(
                                onPressed: () {
                                  sl<CartBloc>()
                                      .add(IncreaseQuantity(index: index));
                                },
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  size: 25,
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
