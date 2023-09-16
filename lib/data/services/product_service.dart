import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/data/models/filter_product_request.dart';
import 'package:prior_soft/data/models/product_model.dart';
import 'package:prior_soft/data/models/review_model.dart';

class ProductService {
    DocumentSnapshot? lastDocument;
  static List<ReviewModel> reviews = [
    ReviewModel(
        productId: '123',
        userName: "Bruno Fernandes",
        userPicture:
            'https://e0.365dm.com/22/03/2048x1152/skysports-bruno-fernandes-manchester-united_5707588.jpg',
        rating: 4.5,
        description:
            'My Son loved his shoes! The down side was that when it had arrived, the box was smashed in and was all beat up. The shoes did have a scuff/some kind of mark on it.',
        createdAt: DateTime.now().subtract(const Duration(days: 18))),
    ReviewModel(
        productId: '124',
        userName: "Nas",
        userPicture:
            'https://i.guim.co.uk/img/media/ae0d885416889797174523437719d33bb88467cd/0_0_6000_3602/master/6000.jpg?width=700&quality=85&auto=format&fit=max&s=f3a46269b5eeb7fb1077d0590e000fa4',
        rating: 5,
        description:
            'My Son loved his shoes! The down side was that when it had arrived, the box was smashed in and was all beat up. The shoes did have a scuff/some kind of mark on it.',
        createdAt: DateTime.now().subtract(const Duration(days: 10))),
    ReviewModel(
        productId: '125',
        userName: "David Guetta",
        userPicture:
            'https://images.t-online.de/2021/08/90543270v2/612x159:924x693/fit-in/1800x0/david-guetta-er-hat-ueber-50-millionen-verkaufte-tontraeger-und-ueber-10-milliarden-songstreams-zu-verbuchen.jpg',
        rating: 4.7,
        description:
            'My Son loved his shoes! The down side was that when it had arrived, the box was smashed in and was all beat up. The shoes did have a scuff/some kind of mark on it.',
        createdAt: DateTime.now()),
    ReviewModel(
        productId: '125',
        userName: "Erling Haaland",
        userPicture:
            'https://upload.wikimedia.org/wikipedia/commons/6/6e/Erling_Haaland_2023_%28cropped-v2%29.jpg',
        rating: 3.7,
        description:
            'My Son loved his shoes! The down side was that when it had arrived, the box was smashed in and was all beat up. The shoes did have a scuff/some kind of mark on it.',
        createdAt: DateTime.now().subtract(const Duration(days: 1))),
  ];
  List<ProductModel> productsMock = [
    // ProductModel(
    //     productId: '1',
    //     name: 'Nike Air Jordan',
    //     price: 200,
    //     image: [
    //       'https://robbreport.com/wp-content/uploads/2022/10/RR_Best_Jordan_Sneakers_XI_OG_Black.jpg?w=1000',
    //     ],
    //     brand: 'Nike',
    //     description:
    //         'Air Jordan is a type or brand of basketball shoes produced by Nike, Inc. since 1984. In the name “Air” means air cushion technology. “Jordan” means Michael ',
    //     rating: 4,
    //     review: [],
    //     size: [39, 40, 41, 42]),
    ProductModel(
        id: '2',
        name: 'Nike Air Jordan 4',
        price: 240,
        image: [
          'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/ef7d1e6b-bac1-4da9-89f1-90b9e9311e39/air-jordan-3-retro-shoes-TJf2lm.png'
        ],
        brand: 'Nike',
        brandImage:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Adidas_isologo.svg/640px-Adidas_isologo.svg.png',
        description:
            'Air Jordan is a type or brand of basketball shoes produced by Nike, Inc. since 1984. In the name “Air” means air cushion technology. “Jordan” means Michael ',
        rating: 3,
        reviews: reviews,
        colors: ['Red', 'Blue'],
        sizes: [39, 40, 41],
        totalReviews: reviews.length,
        gender: 'Male',
        createdAt: DateTime.now()),

    ProductModel(
        id: '389',
        name: 'Adidas Womens Superstar',
        price: 2199,
        image: [
          'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4e894c2b76dd4c8e9013aafc016047af_9366/Superstar_Shoes_White_FV3284_01_standard.jpg'
        ],
        brand: 'Adidas',
        brandImage:
            'https://upload.wikimedia.org/wikipedia/commons/f/fe/Logo_Adidas.png',
        description:
            'Adidas is a type or brand of basketball shoes produced by Nike, Inc. since 1984. In the name “Air” means air cushion technology. “Jordan” means Michael ',
        rating: 2.5,
        reviews: [],
        colors: ['White', 'Green'],
        sizes: [39, 40],
        totalReviews: reviews.length,
        gender: 'Female',
        createdAt: DateTime.now()),
    ProductModel(
        id: '65',
        name: 'Puma Ca Pro Classic Lace Up',
        price: 29,
        image: ['https://i.ebayimg.com/images/g/PdgAAOSwuClkkNsn/s-l1200.webp'],
        brand: 'Puma',
        brandImage:
            'https://upload.wikimedia.org/wikipedia/commons/8/88/Puma-Logo.png',
        description:
            'Puma is a type or brand of basketball shoes produced by Puma, Inc. since 1984. In the name “Air” means air cushion technology. Puma means Puma ',
        rating: 4.5,
        reviews: reviews,
        colors: [
          'Black',
          'Green',
        ],
        sizes: [40, 41],
        totalReviews: reviews.length,
        gender: 'Female',
        createdAt: DateTime.now()),
  ];
Future<Either<Error, List<ProductModel>>> getProducts(int pageNumber) async {
  print('the current pageNumber is: $pageNumber');
  try {
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('products')
        .orderBy('rating', descending: true)
        .limit(totalProducts);

    if (pageNumber > 1) {
      DocumentSnapshot<Map<String, dynamic>> lastDocument =
          await FirebaseFirestore.instance
              .collection('products')
              .orderBy('rating', descending: true)
              .limit(totalProducts)
              .get()
              .then((snapshot) => snapshot.docs.last);

      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();

    List<ProductModel> products = snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList();

    return Right(products);
  } catch (e) {
    print('The error from getProducts response is: ${e.toString()}');
    return Left(Error());
  }
}

  Future<Either<Error, List<ProductModel>>> getFilteredProducts(
      FilterProductRequest filterProductRequest) async {
    try {
      Query<Map<String, dynamic>> query =
          FirebaseFirestore.instance.collection('products');

      if (filterProductRequest.brand != 'All') {
        query = query.where('brand', isEqualTo: filterProductRequest.brand);
      }

      query = query.where('price',
          isGreaterThanOrEqualTo: filterProductRequest.priceMin);

      query = query.where('price',
          isLessThanOrEqualTo: filterProductRequest.priceMax);

      query = query.where('gender', isEqualTo: filterProductRequest.gender);

      query = query.where('color', isEqualTo: filterProductRequest.color);
      if (filterProductRequest.option == ProductSortOption.highestPrice) {
        query = query.orderBy('price', descending: false);
      } else if (filterProductRequest.option == ProductSortOption.mostRecent) {
        query = query.orderBy('timestamp', descending: true);
      } else if (filterProductRequest.option == ProductSortOption.lowestPrice) {
        query = query.orderBy('price');
      }
      // else if (filterProductRequest.option == ProductSortOption.highestReview) {
      //   query = query.orderBy('reviews', descending: true);
      // }

      QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();

      List<ProductModel> products = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return Right(products);
    } catch (e) {
      print('The error from getFilteredProducts response is: ${e.toString()}');
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
