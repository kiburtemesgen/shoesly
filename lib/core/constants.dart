import 'package:flutter/material.dart';
import 'package:prior_soft/data/models/brand_model.dart';
import 'package:prior_soft/data/models/color_model.dart';

const urbanist = 'urbanist';
const kPadding = 25.0;

final brandsList = [
  BrandModel(
      name: 'Nike', icon: 'https://pngimg.com/uploads/nike/nike_PNG12.png'),
  BrandModel(
      name: 'Puma',
      icon:
          'https://upload.wikimedia.org/wikipedia/commons/8/88/Puma-Logo.png'),
  BrandModel(
      name: 'Adidas',
      icon:
          'https://upload.wikimedia.org/wikipedia/commons/f/fe/Logo_Adidas.png'),
  BrandModel(
      name: 'Reebok',
      icon:
          'https://logos-world.net/wp-content/uploads/2020/04/Reebok-Symbol.png'),
];

final colorsList = [
  ColorModel(name: 'Black', color: Colors.black),
  ColorModel(name: 'Red', color: Colors.red),
  ColorModel(name: 'White', color: Colors.white),
  ColorModel(name: 'Blue', color: Colors.blue),
  ColorModel(name: 'Green', color: Colors.green),
];

enum ProductSortOption {
  mostRecent,
  lowestPrice,
  highestPrice,
  highestReview,
}

const totalProducts = 6;
