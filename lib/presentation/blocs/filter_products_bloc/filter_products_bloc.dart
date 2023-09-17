import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/data/models/filter_product_request.dart';
import 'package:prior_soft/presentation/blocs/filter_products_bloc/filter_products_event.dart';
import 'package:prior_soft/presentation/blocs/filter_products_bloc/filter_products_state.dart';

class FilterProductsBloc
    extends Bloc<FilterProductsEvent, FilterProductsState> {
  static final filterProductStateInitial = FilterProductsState(
      filterProductRequest: FilterProductRequest(
          brand: null,
          priceMin: null,
          priceMax: null,
          gender: null,
          color: null,
          option: null),
      filterCount: 0);
  FilterProductsBloc() : super(filterProductStateInitial) {
    on<FilterByBrand>(_handleFilterByBrand);
    on<FilterByPriceMin>(_handleFilterByPriceMin);
    on<FilterByPriceMax>(_handleFilterByPriceMax);
    on<FilterBySortOption>(_handleFilterBySortOption);
    on<FilterByGender>(_handleFilterByGender);
    on<FilterByColor>(_handleFilterByColor);
    on<FilterProductsReset>(_handleFilterProductsReset);
  }

  void _handleFilterByBrand(
      FilterByBrand event, Emitter<FilterProductsState> emit) {
    int updatedCount = state.filterProductRequest.brand == null
        ? state.filterCount + 1
        : state.filterCount;
    emit(FilterProductsState(
        filterProductRequest:
            state.filterProductRequest.copyWith(brand: event.brand),
        filterCount: updatedCount));
  }

  void _handleFilterByPriceMin(
      FilterByPriceMin event, Emitter<FilterProductsState> emit) {
    int updatedCount = state.filterProductRequest.priceMin == null
        ? state.filterCount + 1
        : state.filterCount;
    emit(FilterProductsState(
        filterProductRequest:
            state.filterProductRequest.copyWith(priceMin: event.priceMin),
        filterCount: updatedCount));
  }

  void _handleFilterByPriceMax(
      FilterByPriceMax event, Emitter<FilterProductsState> emit) {
    int updatedCount = state.filterProductRequest.priceMax == null
        ? state.filterCount + 1
        : state.filterCount;
    emit(FilterProductsState(
        filterProductRequest:
            state.filterProductRequest.copyWith(priceMax: event.priceMax),
        filterCount: updatedCount));
  }

  void _handleFilterBySortOption(
      FilterBySortOption event, Emitter<FilterProductsState> emit) {
    int updatedCount = state.filterProductRequest.option == null
        ? state.filterCount + 1
        : state.filterCount;
    emit(FilterProductsState(
        filterProductRequest:
            state.filterProductRequest.copyWith(option: event.option),
        filterCount: updatedCount));
  }

  void _handleFilterByGender(
      FilterByGender event, Emitter<FilterProductsState> emit) {
    int updatedCount = state.filterProductRequest.gender == null
        ? state.filterCount + 1
        : state.filterCount;
    emit(FilterProductsState(
        filterProductRequest:
            state.filterProductRequest.copyWith(gender: event.gender),
        filterCount: updatedCount));
  }

  void _handleFilterByColor(
      FilterByColor event, Emitter<FilterProductsState> emit) {
    int updatedCount = state.filterProductRequest.color == null
        ? state.filterCount + 1
        : state.filterCount;
    emit(FilterProductsState(
        filterProductRequest:
            state.filterProductRequest.copyWith(color: event.color),
        filterCount: updatedCount));
  }

  void _handleFilterProductsReset(
      FilterProductsReset event, Emitter<FilterProductsState> emit) {
    emit(filterProductStateInitial);
  }
}
