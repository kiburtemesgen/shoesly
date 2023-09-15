import 'package:equatable/equatable.dart';
import 'package:prior_soft/data/models/filter_product_model.dart';
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
  final int pageIndex;
  final FilterProductModel? filterProductModel;

  GetProductsSuccess(
      {required this.products,
      required this.pageIndex,
      required this.filterProductModel});

  @override
  List<Object?> get props => [products, pageIndex, filterProductModel];
}
