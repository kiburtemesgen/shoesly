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
  DateTime createdAt; // Add a DateTime field

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.brand,
    required this.brandImage,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.colors,
    required this.sizes,
    required this.createdAt, // Initialize the DateTime field in the constructor
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      image: List<String>.from(json['image']),
      brand: json['brand'],
      brandImage: json['brandImage'],
      description: json['description'],
      rating: json['rating'].toDouble(),
      reviews: List<ReviewModel>.from(json['reviews'].map((reviewJson) => ReviewModel.fromJson(reviewJson))),
      colors: List<String>.from(json['colors']),
      sizes: List<int>.from(json['sizes']),
      createdAt: DateTime.parse(json['createdAt']), // Parse the DateTime field
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'brand': brand,
      'brandImage': brandImage,
      'description': description,
      'rating': rating,
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'colors': colors,
      'sizes': sizes,
      'createdAt': createdAt.toIso8601String(), // Convert the DateTime field to a string
    };
  }
}