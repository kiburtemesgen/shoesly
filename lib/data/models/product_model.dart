import 'package:prior_soft/data/models/review_model.dart';

class ProductModel {
  String id;
  String name;
  double price;
  List<String> image;
  String brand;
  String brandImage;
  String description;
  double rating;
  List<int> sizes;
  List<String> colors;
  List<ReviewModel> reviews;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.brand,
      required this.brandImage,
      required this.description,
      required this.rating,
      required this.reviews,
      required this.colors,
      required this.sizes});
}
