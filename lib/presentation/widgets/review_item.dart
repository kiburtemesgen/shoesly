  import 'package:flutter/material.dart';
import 'package:prior_soft/core/utils/format_review_date.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/data/models/review_model.dart';

Widget reviewItem(ReviewModel review) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(180),
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.network(
                review.userPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        text: review.userName,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                    customText(
                        text: formatReviewDate(review.createdAt),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey)
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                customText(text: review.description)
              ],
            ),
          )
        ],
      ),
    );
  }