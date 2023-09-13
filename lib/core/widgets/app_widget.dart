import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/injector.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_bloc.dart';
import 'package:prior_soft/presentation/discover_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductsBloc>(create: (_) => sl<GetProductsBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoesly',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DiscoverPage(),
      ),
    );
  }
}
