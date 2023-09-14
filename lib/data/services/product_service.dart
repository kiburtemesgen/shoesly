import 'package:dartz/dartz.dart';
import 'package:prior_soft/data/models/product_model.dart';
import 'package:prior_soft/data/models/review_model.dart';

class ProductService {
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
        reviews: [
          ReviewModel(
              userId: '123',
              userName: "Nolan Cadter",
              userPicture:
                  'https://e0.365dm.com/22/03/2048x1152/skysports-bruno-fernandes-manchester-united_5707588.jpg',
              rating: 4.5,
              description:
                  'My Son loved his shoes! The down side was that when it had arrived, the box was smashed in and was all beat up. The shoes did have a scuff/some kind of mark on it.',
              date: DateTime.now())
        ],
        colors: ['Red', 'Blue'],
        sizes: [39, 40, 41]),
    ProductModel(
        id: '3',
        name: 'Nike Air Jordan 1 low',
        price: 240,
        image: [
          'https://grailify.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBN0lzQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--821bc8dc97ccd04ea0e0247c5cdbd58f5e2c36ef/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDRG9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RW5KbGMybDZaVjkwYjE5bWFYUmJCMmtDSUFOcEFpQURPZ3h4ZFdGc2FYUjVhVjg9IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--ea1da7d273fb4fac2f3bf305727b365ca4d6c39a/Image%201'
        ],
        brand: 'Nike',
        brandImage:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Adidas_isologo.svg/640px-Adidas_isologo.svg.png',
        description:
            'Air Jordan is a type or brand of basketball shoes produced by Nike, Inc. since 1984. In the name “Air” means air cushion technology. “Jordan” means Michael ',
        rating: 3,
        reviews: [],
        colors: ['White', 'Green'],
        sizes: [39, 40]),
    ProductModel(
        id: '4',
        name: 'Nike Air Jordan 1 low',
        price: 240,
        image: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAwvTzMRieP6-Bic97Azsw7hpgCv47wd-IwQ&usqp=CAU'
        ],
        brand: 'Nike',
        brandImage:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Adidas_isologo.svg/640px-Adidas_isologo.svg.png',
        description:
            'Air Jordan is a type or brand of basketball shoes produced by Nike, Inc. since 1984. In the name “Air” means air cushion technology. “Jordan” means Michael ',
        rating: 4 / 5,
        reviews: [],
        colors: ['Black', 'Green', 'Red'],
        sizes: [40]),
  ];
  Future<Either<Error, List<ProductModel>>> getProducts() async {
    await Future.delayed(Duration(seconds: 2));
    return Right(productsMock);
  }
}
