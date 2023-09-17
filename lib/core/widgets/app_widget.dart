import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prior_soft/injector.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:prior_soft/presentation/blocs/filter_products_bloc/filter_products_bloc.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_bloc.dart';
import 'package:prior_soft/presentation/blocs/top_reviews_bloc/top_reviews_bloc.dart';
import 'package:prior_soft/presentation/screens/discover_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductsBloc>(create: (_) => sl<GetProductsBloc>()),
        BlocProvider<CartBloc>(create: (_) => sl<CartBloc>()),
        BlocProvider<GetProductsBloc>(create: (_) => sl<GetProductsBloc>()),
        BlocProvider<TopReviewsBloc>(create: (_) => sl<TopReviewsBloc>()),
        BlocProvider<FilterProductsBloc>(create: (_) => sl<FilterProductsBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoesly',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: DiscoverPage(),
      ),
    );
  }
}
