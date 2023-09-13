import 'package:prior_soft/data/models/review_model.dart';

class ProductModel {
  String productId;
  String name;
  double price;
  List<String> image;
  String brand;
  String description;
  double rating;
  List<double> size;
  List<ReviewModel> review;

  ProductModel(
      {required this.productId,
      required this.name,
      required this.price,
      required this.image,
      required this.brand,
      required this.description,
      required this.rating,
      required this.review,
      required this.size});
}
