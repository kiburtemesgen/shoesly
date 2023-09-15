import 'package:flutter/material.dart';
import 'package:prior_soft/core/widgets/common_appbar.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/data/models/review_model.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.reviews});

  final List<ReviewModel> reviews;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int selectedRatingIndex = 0;
  List<ReviewModel> reivewList = [];
  List<String> ratingList = [
    'All'
        '1',
    '2',
    '3',
    '4',
    '5'
  ];
  @override
  void initState() {
    super.initState();
    reivewList = widget.reviews;
  }

  List<ReviewModel> _filterReview(String query, List<ReviewModel> reviews) {
    List<ReviewModel> revList = [];
    if (query != 'All') {
      reviews = reviews
          .where((review) => ((review.rating).toInt() + 1).toString() == query)
          .toList();
    }
    return revList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _reviewList(context),
        ],
      )),
    );
  }

  Widget _reviewList(BuildContext context) {
    return SizedBox(
      height: 25,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: ratingList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedRatingIndex = index;
                  });
                },
                child: customText(
                    text: ratingList[index],
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: selectedRatingIndex == index
                        ? Colors.black
                        : Colors.grey),
              ),
            );
          }),
    );
  }
}
