import 'package:dartz/dartz.dart';
import 'package:prior_soft/data/models/product_model.dart';
import 'package:prior_soft/data/services/product_service.dart';

abstract class ProductRepository {
  Future<Either<Error, List<ProductModel>>> getProducts();
}

//ProductRepository is an abstract class that defines a contract for accessing and managing product data. P
//roductRepositoryImpl is a concrete implementation that provides the actual implementation of the methods defined in the abstract class, interacting with the data source

class ProductRepositoryImpl extends ProductRepository {
  ProductService productService;
  ProductRepositoryImpl({required this.productService});

  @override
  Future<Either<Error, List<ProductModel>>> getProducts() async {
    final response = await productService.getProducts();
    return response.fold((error) => Left(error), (result) => Right(result));
  }
}
