  import 'package:flutter/material.dart';

Widget ratingWidget(double rating) {
    int roundedRating = rating.ceil();
    return Row(
      children: List.generate(5, (index) {
        if (index < roundedRating) {
          return const Icon(Icons.star, color: Colors.amber, size: 15,);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey, size: 15,);
        }
      }),
    );
  }