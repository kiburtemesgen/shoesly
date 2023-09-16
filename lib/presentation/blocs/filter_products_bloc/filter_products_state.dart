import 'package:equatable/equatable.dart';
import 'package:prior_soft/data/models/filter_product_model.dart';

class FilterProductsState extends Equatable {
  final FilterProductModel filterProductModel;
  const FilterProductsState({required this.filterProductModel});

  @override
  List<Object?> get props => [filterProductModel];
}
