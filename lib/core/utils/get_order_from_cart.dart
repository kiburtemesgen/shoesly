import 'package:prior_soft/data/models/order_model.dart';
import 'package:prior_soft/injector.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_bloc.dart';

OrderModel getOrderFromCart() {
  OrderModel order = OrderModel.empty();
  final carts = sl<CartBloc>().state.carts;
  double subTotal = 0;
  for (var cart in carts) {
    subTotal += cart.product.price * cart.quantity;
    order.orderDetail.add(OrderDetail(
        id: cart.product.id,
        name: cart.product.name,
        price: cart.product.price,
        brand: cart.product.brand,
        color: cart.color,
        quantity: cart.quantity,
        size: cart.size));
  }
  double shipping =
      subTotal * 0.1; //I assume shipping price is 10% of total items price
  double total = shipping + subTotal;
  order.shipping = shipping;
  order.subTotal = subTotal;
  order.total = total;
  order.paymentMethod = 'Credit Card'; 
  order.location = 'Addis Ababa';
  return order;
}
