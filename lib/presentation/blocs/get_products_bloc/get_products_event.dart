import 'package:prior_soft/data/models/filter_product_request.dart';

abstract class GetProductsEvent {}

class GetProducts extends GetProductsEvent {
  String brand;
  int total;
  GetProducts({required this.brand, required this.total});
}

class GetFilteredProducts extends GetProductsEvent {
  FilterProductRequest filterProductRequest;
  GetFilteredProducts({required this.filterProductRequest});
}

class LoadMoreProducts extends GetProductsEvent {
  int pageNumber;
  String brand;
  int total;
  LoadMoreProducts({required this.pageNumber, required this.brand, required this.total});
}
