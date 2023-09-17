import 'package:prior_soft/core/constants.dart';


sealed class FilterProductsEvent {}

class FilterByBrand extends FilterProductsEvent {
  final String brand;
  FilterByBrand({required this.brand});
}

class FilterByPriceMin extends FilterProductsEvent {
  final double priceMin;
  FilterByPriceMin({required this.priceMin});
}

class FilterByPriceMax extends FilterProductsEvent {
  final double priceMax;
  FilterByPriceMax({required this.priceMax});
}

class FilterBySortOption extends FilterProductsEvent {
  final ProductSortOption option;
  FilterBySortOption({required this.option});
}
class FilterByGender extends FilterProductsEvent {
  final String gender;
  FilterByGender({required this.gender});
}

class FilterByColor extends FilterProductsEvent {
  final String color;
  FilterByColor({required this.color});
}

class FilterProductsReset extends FilterProductsEvent{}
