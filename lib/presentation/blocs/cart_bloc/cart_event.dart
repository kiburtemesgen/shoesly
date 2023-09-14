import 'package:prior_soft/data/models/cart_model.dart';

sealed class CartEvent {}

class AddToCart extends CartEvent {
  CartModel cart;
  
  AddToCart({required this.cart});
}

class RemoveFromCart extends CartEvent {
  final int index;
  RemoveFromCart({required this.index});
}

class IncreaseQuantity extends CartEvent {
  final int index;
  IncreaseQuantity({required this.index});
}
class DecreaseQuantity extends CartEvent {
  final int index;
  DecreaseQuantity({required this.index});
}