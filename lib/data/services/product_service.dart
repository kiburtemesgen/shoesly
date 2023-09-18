import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/data/models/filter_product_request.dart';
import 'package:prior_soft/data/models/order_model.dart';
import 'package:prior_soft/data/models/product_model.dart';
import 'package:prior_soft/data/models/review_model.dart';

class ProductService {
  DocumentSnapshot? lastDocument;

  Future<Either<Error, List<ProductModel>>> getProducts(
      int pageNumber, String brand, int total) async {
    try {
      if (pageNumber == 0) {
        lastDocument = null;
      }
      final collectionRef = FirebaseFirestore.instance.collection('products');

      Query<Map<String, dynamic>> query = collectionRef;

      if (brand != 'All') {
        query = query.where('brand', isEqualTo: brand);
      }

      if (pageNumber > 0) {
        query = query.startAfterDocument(lastDocument!);
      }

      query = query.limit(totalProducts);

      QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        return const Right([]);
      }

      lastDocument = snapshot.docs.last;

      List<ProductModel> products = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return Right(products);
    } catch (e) {
      return Left(Error());
    }
  }

  Future<Either<Error, List<ProductModel>>> getFilteredProducts(
      FilterProductRequest filterProductRequest, int pageNumber) async {
    try {
      if (pageNumber == 0) {
        lastDocument = null;
      }

      Query<Map<String, dynamic>> query =
          FirebaseFirestore.instance.collection('products');

      if (filterProductRequest.brand != null) {
        query = query.where('brand', isEqualTo: filterProductRequest.brand);
      }

      if (filterProductRequest.priceMin != null) {
        query = query.where('price',
            isGreaterThanOrEqualTo: filterProductRequest.priceMin);
      }

      if (filterProductRequest.priceMax != null) {
        query = query.where('price',
            isLessThanOrEqualTo: filterProductRequest.priceMax);
      }

      if (filterProductRequest.gender != null) {
        query = query.where('gender', isEqualTo: filterProductRequest.gender);
      }

      if (filterProductRequest.color != null) {
        query = query
            .where('colors', arrayContainsAny: [filterProductRequest.color]);
      }

      if (filterProductRequest.option != null) {
        if (filterProductRequest.option == ProductSortOption.highestPrice) {
          query = query.orderBy('price', descending: true);
        } else if (filterProductRequest.option ==
            ProductSortOption.mostRecent) {
          query = query.orderBy('createdAt', descending: true);
        } else if (filterProductRequest.option ==
            ProductSortOption.lowestPrice) {
          query = query.orderBy('price');
        } else if (filterProductRequest.option ==
            ProductSortOption.highestReview) {
          query = query.orderBy('reviews', descending: true);
        }
      }

      if (pageNumber > 0) {
        query = query.startAfterDocument(lastDocument!);
      }

      query = query.limit(totalProducts);

      QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        return const Right([]);
      }

      lastDocument = snapshot.docs.last;

      List<ProductModel> products = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return Right(products);
    } catch (e) {
      return Left(Error());
    }
  }

  Future<Either<Error, Unit>> createOrder(OrderModel order) async {
    final ordersCollection = FirebaseFirestore.instance.collection('orders');
    try {
      ordersCollection.add(order.toJson());
      return const Right(unit);
    } catch (e) {
      return Left(Error());
    }
  
  }

  Future<Either<Error, List<ReviewModel>>> getReviews(
      String productId, int? rating) async {
    List<ReviewModel> reviews = [];
    try {
      Query<Map<String, dynamic>> query =
          FirebaseFirestore.instance.collection('reviews');

      if (rating != null) {
        query = query
            .where(
              'rating',
              isGreaterThanOrEqualTo: rating,
            )
            .where('rating', isLessThan: rating + 1);
      }

      final QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();
      for (var review in snapshot.docs) {
        reviews.add(ReviewModel.fromJson(review.data()));
      }

      return Right(reviews);
    } catch (e) {
      return Left(Error());
    }
  }

  Future<Either<Error, List<ReviewModel>>> getTopReviews(
      String productId) async {
    List<ReviewModel> reviews = [];
    try {
      Query<Map<String, dynamic>> query =
          FirebaseFirestore.instance.collection('reviews');

      query = query.orderBy('rating').limit(3);

      final QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();
      for (var review in snapshot.docs) {
        reviews.add(ReviewModel.fromJson(review.data()));
      }

      return Right(reviews);
    } catch (e) {
      return Left(Error());
    }
  }
}
