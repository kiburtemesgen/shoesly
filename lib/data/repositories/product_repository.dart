import 'package:dartz/dartz.dart';
import 'package:prior_soft/data/models/filter_product_request.dart';
import 'package:prior_soft/data/models/product_model.dart';
import 'package:prior_soft/data/models/review_model.dart';
import 'package:prior_soft/data/services/product_service.dart';

abstract class ProductRepository {
  Future<Either<Error, List<ProductModel>>> getProducts(int pageNumber);
  Future<Either<Error, List<ProductModel>>> getFilteredProducts(FilterProductRequest filterProductRequest);
  Future<Either<Error, List<ReviewModel>>> getReviews(String productId, int rating);
  Future<Either<Error, List<ReviewModel>>> getTopReviews(String productId);
}

//ProductRepository is an abstract class that defines a contract for accessing and managing product data. P
//roductRepositoryImpl is a concrete implementation that provides the actual implementation of the methods defined in the abstract class, interacting with the data source

class ProductRepositoryImpl extends ProductRepository {
  ProductService productService;
  ProductRepositoryImpl({required this.productService});

  @override
  Future<Either<Error, List<ProductModel>>> getProducts(int pageNumber) async {
    final response = await productService.getProducts(pageNumber);
    return response.fold((error) => Left(error), (result) => Right(result));
  }

  @override
  Future<Either<Error, List<ProductModel>>> getFilteredProducts(FilterProductRequest filterProductRequest) async {
    final response = await productService.getFilteredProducts(filterProductRequest);
    return response.fold((error) => Left(error), (result) => Right(result));
  }
  
  @override
  Future<Either<Error, List<ReviewModel>>> getReviews(String productId, int? rating) async{
   final response = await productService.getReviews(productId, rating,);
   return response.fold((error) => Left(error), (result) => Right(result));
  }
  
  @override
  Future<Either<Error, List<ReviewModel>>> getTopReviews(String productId)async {
    final response = await productService.getTopReviews(productId);
   return response.fold((error) => Left(error), (result) => Right(result));
  }
}
