import 'package:flutter/material.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';

Widget commonFAB(String text, String priceText, Function() onTap, double amount,
    BuildContext context) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(text: priceText, fontSize: 12, color: Colors.grey),
              customText(
                  text: '\$${amount.toStringAsFixed(2)}',
                  fontSize: 16,
                  fontWeight: FontWeight.w900)
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.black),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
              child: customText(
                  text: text, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ]),
      ),
    ),
  );
}
