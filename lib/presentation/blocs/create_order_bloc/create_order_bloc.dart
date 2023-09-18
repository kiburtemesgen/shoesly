import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/data/repositories/product_repository.dart';
import 'package:prior_soft/presentation/blocs/create_order_bloc/create_order_event.dart';
import 'package:prior_soft/presentation/blocs/create_order_bloc/create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  ProductRepository productRepository;
  CreateOrderBloc({required this.productRepository})
      : super(CreateOrderInitial()) {
    on((event, emit) async {
      if (event is CreateOrder) {
        emit(CreateOrderLoading());
        final response = await productRepository.createOrder(event.order);
        response.fold((error) => emit(CreateOrderError()),
            (result) => emit(CreateOrderSuccess()));
      } else if (event is CreateOrderReset) {
        emit(CreateOrderInitial());
      }
    });
  }
}
