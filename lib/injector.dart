import 'package:get_it/get_it.dart';
import 'package:prior_soft/data/repositories/product_repository.dart';
import 'package:prior_soft/data/services/product_service.dart';
import 'package:prior_soft/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:prior_soft/presentation/blocs/get_products_bloc/get_products_bloc.dart';
import 'package:prior_soft/presentation/blocs/get_reviews_bloc/get_reviews_bloc.dart';
import 'package:prior_soft/presentation/blocs/top_reviews_bloc/top_reviews_bloc.dart';

final sl = GetIt.instance;

Future setupInjector() async {
//Services
  sl.registerLazySingleton<ProductService>(() => ProductService());

//Repositories
  sl.registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(productService: sl()));

//Blocs
  sl.registerLazySingleton<GetProductsBloc>(
      () => GetProductsBloc(productRepository: sl()));
  sl.registerLazySingleton<CartBloc>(() => CartBloc());
  sl.registerLazySingleton<GetReviewsBloc>(
      () => GetReviewsBloc(productRepository: sl()));
  sl.registerLazySingleton<TopReviewsBloc>(
      () => TopReviewsBloc(productRepository: sl()));
}
