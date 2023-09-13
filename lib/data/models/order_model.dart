import 'package:prior_soft/data/models/product_model.dart';

class OrderModel {
  List<ProductModel> products;
  String paymentMethod;
  String location;
  double total;

  OrderModel(
      {required this.products,
      required this.paymentMethod,
      required this.location,
      required this.total});
}
