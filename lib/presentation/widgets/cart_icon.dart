import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_state.dart';
import 'package:prior_soft/presentation/screens/cart_page.dart';

Widget cartIcon() {
  return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(right: kPadding),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const CartPage()));
          },
          child: SizedBox(
            width: 40,
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      state.carts.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
