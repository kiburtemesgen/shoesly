import 'package:prior_soft/data/models/product_model.dart';

class CartModel {
  ProductModel product;
  int quantity;
  String color;
  int size;

  CartModel(
      {required this.product,
      required this.quantity,
      required this.color,
      required this.size});

CartModel copyWith({
    ProductModel? product,
    int? quantity,
    String? color,
    int? size,
  }) {
    return CartModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }
    
}
