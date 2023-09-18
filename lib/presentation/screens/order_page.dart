import 'package:flutter/material.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/utils/get_order_from_cart.dart';
import 'package:prior_soft/core/widgets/common_appbar.dart';
import 'package:prior_soft/core/widgets/common_fab.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/data/models/order_model.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final order = getOrderFromCart();
    return Scaffold(
      floatingActionButton: commonFAB('PAYMENT', 'Grand Total', () {
      }, order.total, context),
      appBar: commonAppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: 'Order Summary'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('Information'),
            _informationItem('Payment Method', order.paymentMethod),
            _divider(),
            _informationItem('Location', order.location),
            _title('Order Detail'),
            const SizedBox(
              height: 20.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: order.orderDetail.length,
              itemBuilder: (context, index){
              return _orderDetailItem(order.orderDetail[index]);
            },),
            _title('Payment Detail'),
            const SizedBox(
              height: 20.0,
            ),
            _paymentDetailItem('Sub Total', order.subTotal, false),
            _paymentDetailItem('Shipping', order.shipping, false),
            _divider(),
            const SizedBox(
              height: 10,
            ),
            _paymentDetailItem('Total Order', order.total, true),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Container(
        height: 0.2,
        color: Colors.grey,
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: customText(text: text, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _informationItem(String title, String subTitile) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                  text: title, fontSize: 12, fontWeight: FontWeight.bold),
              customText(text: subTitile, fontSize: 12, color: Colors.grey),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _orderDetailItem(OrderDetail orderDetail) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                  text: orderDetail.name,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 15,
              ),
              customText(
                  text: '${orderDetail.brand} ${orderDetail.color} ${orderDetail.size}     ${orderDetail.quantity}x',
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300)
            ],
          ),
          customText(
              text: '\$${orderDetail.price.toStringAsFixed(2)}', fontSize: 14, fontWeight: FontWeight.bold)
        ],
      ),
    );
  }

  Widget _paymentDetailItem(String title, double price, bool isTotal) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(text: title, fontSize: 14, color: Colors.grey),
          customText(
              text: '\$${price.toStringAsFixed(2)}',
              fontSize: isTotal ? 16 : 14,
              fontWeight: FontWeight.w900)
        ],
      ),
    );
  }
}
