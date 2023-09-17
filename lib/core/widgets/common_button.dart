import 'package:flutter/material.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';

Widget commonButton(
    {required String text,
    required Function() onTap,
    required Color backgroundColor,
    required Color textColor}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: customText(
            text: text, fontWeight: FontWeight.bold, color: textColor),
      ),
    ),
  );
}
