import 'package:flutter/material.dart';
import 'package:prior_soft/core/widgets/app_widget.dart';
import 'package:prior_soft/injector.dart';
import 'package:prior_soft/presentation/product_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  runApp(const AppWidget());
}
