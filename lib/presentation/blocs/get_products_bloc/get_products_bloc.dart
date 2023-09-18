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
        final response = await productRepository.getProducts(0, event.brand, event.total);
        response.fold(
            (error) => emit(GetProductsError()),
            (result) => emit(GetProductsSuccess(
                products: result,
                isLoading: false,
                isMaxReached: false,
                brand: event.brand,
                filterProductRequest: null)));
      } else if (event is GetFilteredProducts) {
        emit(GetProductsLoading());
        final response = await productRepository
            .getFilteredProducts(event.filterProductRequest, 0);
        response.fold(
            (error) => emit(GetProductsError()),
            (result) => emit(GetProductsSuccess(
                  products: result,
                  isLoading: false,
                  isMaxReached: false,
                  filterProductRequest: event.filterProductRequest,
                )));
      } else if (event is LoadMoreProducts) {
        final currentState = state as GetProductsSuccess;
        final currentProducts = [...currentState.products];
        final filterProductRequest = currentState.filterProductRequest;
        String? brand = currentState.brand;
        
      
        emit(GetProductsSuccess(
            products: currentProducts,
            isLoading: true,
            isMaxReached: false,
            filterProductRequest: filterProductRequest));
        if (filterProductRequest == null) {
          final response = await productRepository.getProducts(event.pageNumber, brand!, event.total);
          response.fold((error) => emit(GetProductsError()), (result) {
            if (result.isEmpty) {
              emit(GetProductsSuccess(
                  products: [...currentProducts, ...result],
                  isLoading: false,
                  isMaxReached: true,
                  filterProductRequest: filterProductRequest));
            } else {
              emit(GetProductsSuccess(
                  products: [...currentProducts, ...result],
                  isLoading: false,
                  brand: brand,
                  isMaxReached: false,
                  filterProductRequest: filterProductRequest));
            }
          });
        } else {
            emit(GetProductsSuccess(
            products: currentProducts,
            isLoading: true,
            isMaxReached: false,
            filterProductRequest: filterProductRequest));
          final response =
              await productRepository.getFilteredProducts(filterProductRequest, event.pageNumber);

          response.fold(
              (error) => emit(GetProductsError()),
              (result) {
                if (result.isEmpty) {
              emit(GetProductsSuccess(
                  products: [...currentProducts, ...result],
                  isLoading: false,
                  isMaxReached: true,
                  filterProductRequest: filterProductRequest));
            } else {
              emit(GetProductsSuccess(
                  products: [...currentProducts, ...result],
                  isLoading: false,
                  brand: brand,
                  isMaxReached: false,
                  filterProductRequest: filterProductRequest));
            }
              });
        }
      }
    });
  }
}
