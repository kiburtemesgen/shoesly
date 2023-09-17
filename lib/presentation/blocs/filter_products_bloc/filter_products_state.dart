import 'package:equatable/equatable.dart';
import 'package:prior_soft/data/models/filter_product_request.dart';

class FilterProductsState extends Equatable {
  final FilterProductRequest filterProductRequest;
  final int filterCount;

  const FilterProductsState({required this.filterProductRequest, required this.filterCount});

  @override
  List<Object?> get props => [filterProductRequest];
}