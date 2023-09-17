import 'package:equatable/equatable.dart';
import 'package:prior_soft/data/models/filter_product_request.dart';
import 'package:prior_soft/data/models/product_model.dart';

abstract class GetProductsState extends Equatable {}

class GetProductsInitial extends GetProductsState {
  @override
  List<Object?> get props => [];
}

class GetProductsLoading extends GetProductsState {
  @override
  List<Object?> get props => [];
}

class GetProductsError extends GetProductsState {
  @override
  List<Object?> get props => [];
}

class GetProductsSuccess extends GetProductsState {
  final List<ProductModel> products;
  final bool isLoading;
  final bool isMaxReached;
  final String? brand;
  final FilterProductRequest? filterProductRequest;

  GetProductsSuccess(
      {required this.products,
      required this.isLoading,
     required this.isMaxReached,
      this.brand,
      required this.filterProductRequest});

  @override
  List<Object?> get props => [products, isLoading, isMaxReached, brand, filterProductRequest];
}
