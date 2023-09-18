import 'package:prior_soft/data/models/order_model.dart';

abstract class CreateOrderEvent {}

class CreateOrder extends CreateOrderEvent {
  final OrderModel order;
  CreateOrder({required this.order});
}

class CreateOrderReset extends CreateOrderEvent {}
