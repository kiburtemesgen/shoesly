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
        final response = await productRepository.getProducts(0);
        response.fold(
            (error) => emit(GetProductsError()),
            (result) => emit(GetProductsSuccess(
                products: result,
                isLoading: false,
                pageIndex: 0,
                filterProductRequest: null)));
      } else if (event is GetFilteredProducts) {
        emit(GetProductsLoading());
        final response = await productRepository
            .getFilteredProducts(event.filterProductRequest);
        response.fold(
            (error) => emit(GetProductsError()),
            (result) => emit(GetProductsSuccess(
                  products: result,
                  isLoading: false,
                  pageIndex: 0,
                  filterProductRequest: event.filterProductRequest,
                )));
      } else if (event is LoadMoreProducts) {
        final currentState = state as GetProductsSuccess;
        var currentProducts = [...currentState.products];
        var filterProductRequest = currentState.filterProductRequest;
        var currentIndex = currentState.pageIndex;
        emit(GetProductsSuccess(
            products: currentProducts,
            isLoading: true,
            pageIndex: currentIndex,
            filterProductRequest: filterProductRequest));
        if (filterProductRequest == null) {
          final response = await productRepository.getProducts(++currentIndex);
          response.fold(
              (error) => emit(GetProductsError()),
              (result) => emit(GetProductsSuccess(
                  products: [...currentProducts, ...result],
                  isLoading: false,
                  pageIndex: currentIndex,
                  filterProductRequest: filterProductRequest)));
        } else {
          final response =
              await productRepository.getFilteredProducts(filterProductRequest);

          response.fold(
              (error) => emit(GetProductsError()),
              (result) => emit(GetProductsSuccess(
                  products: [...currentProducts, ...result],
                  isLoading: false,
                  pageIndex: currentIndex++,
                  filterProductRequest: filterProductRequest)));
        }
      }
    });
  }
}
