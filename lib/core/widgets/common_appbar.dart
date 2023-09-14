import 'package:flutter/material.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';

AppBar commonAppBar({String? title, List<Widget>? actions, Widget? leading}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: title == null
        ? null
        : customText(text: title, fontSize: 14, fontWeight: FontWeight.bold),
    leading: leading,
    actions: actions,
    automaticallyImplyLeading: false,
    centerTitle: true,
  );
}
