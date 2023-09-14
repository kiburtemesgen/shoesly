import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/data/models/cart_model.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_event.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(carts: [])) {
    on((CartEvent event, emit) {
      if (event is AddToCart) {
        //Before adding the product to the cart, first we have to check whether the product is already exist or not
        final existingCartIndex = state.carts.indexWhere(
          (cart) => cart.product.id == event.cart.product.id,
        );

        if (existingCartIndex != -1) {
          // Product already exists in cart, update the quantity
          final updatedCarts = List<CartModel>.from(state.carts);
          updatedCarts[existingCartIndex] = CartModel(
            product: event.cart.product,
            quantity: updatedCarts[existingCartIndex].quantity + 1,
            color: state.carts[existingCartIndex].color,
            size: state.carts[existingCartIndex].size,
          );
          emit(CartState(carts: updatedCarts));
        } else {
          // Product doesn't exist in cart, add it
          final updatedCarts = [
            ...state.carts,
            CartModel(
                product: event.cart.product,
                quantity: event.cart.quantity,
                color: event.cart.color,
                size: event.cart.size),
          ];

          emit(CartState(carts: updatedCarts));
        }
      } else if (event is RemoveFromCart) {
        final updatedCart = [
          ...state.carts
        ]; 
        updatedCart
            .removeAt(event.index);

        emit(CartState(carts: updatedCart));
      } else if (event is IncreaseQuantity) {
        final updatedCarts = List<CartModel>.from(state.carts);
        final cartItem = updatedCarts[event.index];
        updatedCarts[event.index] =
            cartItem.copyWith(quantity: cartItem.quantity + 1);

        emit(CartState(carts: updatedCarts));
      } else if (event is DecreaseQuantity) {
        final updatedCarts = List<CartModel>.from(state.carts);
        final cartItem = updatedCarts[event.index];
        if (cartItem.quantity > 1) {
          //Decrement the quantity only when the quantity value is greater than to one
          updatedCarts[event.index] =
              cartItem.copyWith(quantity: cartItem.quantity - 1);

          emit(CartState(carts: updatedCarts));
        }
      }
    });
  }
}
