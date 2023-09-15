import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/data/repositories/product_repository.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_event.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_state.dart';

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final ProductRepository productRepository;
  GetProductsBloc({required this.productRepository})
      : super(GetProductsInitial()) {
    on((event, emit) async {
      if (event is GetProducts) {
        emit(GetProductsLoading());
        final response = await productRepository.getProducts();
        response.fold(
            (error) => emit(GetProductsError()),
            (result) => emit(GetProductsSuccess(
                products: result, pageIndex: 0, filterProductModel: null)));
      } else if (event is GetFilteredProducts) {
        emit(GetProductsLoading());
        final response = await productRepository
            .getFilteredProducts(event.filterProductModel);
        response.fold(
            (error) => emit(GetProductsError()),
            (result) => emit(GetProductsSuccess(
                  products: result,
                  pageIndex: 0,
                  filterProductModel: event.filterProductModel,
                )));
      } else if (event is LoadMoreProducts) {
        final currentState = state as GetProductsSuccess;
        var currentProducts = [...currentState.products];
        var filterProductModel = currentState.filterProductModel;
        var currentIndex = currentState.pageIndex;
        emit(GetProductsLoading());
        if (filterProductModel == null) {
          final response = await productRepository.getProducts();
          response.fold(
              (error) => emit(GetProductsError()),
              (result) => emit(GetProductsSuccess(
                  products: [...currentProducts, ...result],
                  pageIndex: currentIndex++,
                  filterProductModel: filterProductModel)));
        } else {
          final response =
              await productRepository.getFilteredProducts(filterProductModel);

          response.fold(
              (error) => emit(GetProductsError()),
              (result) => emit(GetProductsSuccess(
                  products: [...currentProducts, ...result],
                  pageIndex: currentIndex++,
                  filterProductModel: filterProductModel)));
        }
      }
    });
  }
}
