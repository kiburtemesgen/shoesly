import 'package:prior_soft/core/constants.dart';

class FilterProductModel {
  String brand;
  double priceMin;
  double priceMax;
  String gender;
  String color;
  ProductSortOption option;

  FilterProductModel(
      {required this.brand,
      required this.priceMin,
      required this.priceMax,
      required this.gender,
      required this.color,
      required this.option
      });
}
