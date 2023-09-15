import 'package:prior_soft/data/models/filter_product_model.dart';

abstract class GetProductsEvent {}

class GetProducts extends GetProductsEvent {}

class GetFilteredProducts extends GetProductsEvent {
  FilterProductModel filterProductModel;
  GetFilteredProducts({required this.filterProductModel});
}

class LoadMoreProducts extends GetProductsEvent {}
