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
        response.fold((error) => emit(GetProductsError()),
            (result) => emit(GetProductsSuccess(products: result)));
      }
    });
  }
}
