import 'package:equatable/equatable.dart';
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

  GetProductsSuccess({required this.products});
  @override
  List<Object?> get props => [products];
}
