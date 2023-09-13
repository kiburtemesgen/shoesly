import 'package:flutter/material.dart';
import 'package:prior_soft/core/constants.dart';

Widget customText({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  String? fontFamily,
  TextOverflow? textOverflow,
  int? maxLines,
}) {
  return Text(
    text,
    maxLines: maxLines,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily ?? urbanist,
        overflow: textOverflow),
  );
}
