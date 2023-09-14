import 'package:flutter/material.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/widgets/common_appbar.dart';
import 'package:prior_soft/core/widgets/common_fab.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: commonFAB('PAYMENT', () {}, 725.00, context),
      appBar: commonAppBar(
          leading:
              IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back)),
          title: 'Order Summary'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('Information'),
            _informationItem('Payment Method', 'Credit Card'),
            _divider(),
            _informationItem('Location', 'Semarang, Indonesia'),
            _title('Order Detail'),
            const SizedBox(
              height: 20.0,
            ),
            _orderDetailItem(),
            _orderDetailItem(),
            _orderDetailItem(),
            _title('Payment Detail'),
            const SizedBox(
              height: 20.0,
            ),
            _paymentDetailItem('Sub Total', 705.00, false),
            _paymentDetailItem('Shipping', 20.00, false),
            _divider(),
            const SizedBox(
              height: 10,
            ),
            _paymentDetailItem('Total Order', 725.00, true),
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

  Widget _orderDetailItem() {
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
                  text: 'Jordna 1 Retro High Tie Dye',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 15,
              ),
              customText(
                  text: 'Nike. Red Grey. 40. Qty1',
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300)
            ],
          ),
          customText(
              text: '\$235.00', fontSize: 14, fontWeight: FontWeight.bold)
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
              text: '\$$price',
              fontSize: isTotal ? 16 : 14,
              fontWeight: FontWeight.w900)
        ],
      ),
    );
  }
}
