import 'package:prior_soft/core/constants.dart';

class FilterProductRequest {
  String? brand;
  double? priceMin;
  double? priceMax;
  String? gender;
  String? color;
  ProductSortOption? option;

  FilterProductRequest({
    required this.brand,
    required this.priceMin,
    required this.priceMax,
    required this.gender,
    required this.color,
    required this.option,
  });

  FilterProductRequest copyWith({
    String? brand,
    double? priceMin,
    double? priceMax,
    String? gender,
    String? color,
    ProductSortOption? option,
  }) {
    return FilterProductRequest(
      brand: brand ?? this.brand,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      gender: gender ?? this.gender,
      color: color ?? this.color,
      option: option ?? this.option,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'priceMin': priceMin,
      'priceMax': priceMax,
      'gender': gender,
      'color': color,
      'option': option,
    };
  }
}
