import 'package:prior_soft/data/models/filter_product_request.dart';

abstract class GetProductsEvent {}

class GetProducts extends GetProductsEvent {}

class GetFilteredProducts extends GetProductsEvent {
  FilterProductRequest filterProductRequest;
  GetFilteredProducts({required this.filterProductRequest});
}

class LoadMoreProducts extends GetProductsEvent {}
