import 'package:flutter/material.dart';
import 'package:prior_soft/core/widgets/app_widget.dart';
import 'package:prior_soft/injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const AppWidget());
}
