import 'package:flutter/material.dart';
import 'package:prior_soft/core/constants.dart';
import 'package:prior_soft/core/widgets/common_appbar.dart';
import 'package:prior_soft/core/widgets/custom_text.dart';
import 'package:prior_soft/data/models/review_model.dart';
import 'package:prior_soft/presentation/widgets/review_item.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.reviews, required this.rating});

  final List<ReviewModel> reviews;
  final double rating;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int selectedRatingIndex = 0;
  List<ReviewModel> reivewList = [];
  List<String> ratingList = ['All', '1', '2', '3', '4', '5'];
  @override
  void initState() {
    super.initState();
    reivewList = widget.reviews;
  }

  List<ReviewModel> _filterReview(String query, List<ReviewModel> reviews) {
    print('the review: ${reviews[0].rating.toInt() == 5}');
    List<ReviewModel> revList = [];
    if (query != 'All') {
      reviews = reviews
          .where((review) => ((review.rating).toInt() + 1) == int.parse(query))
          .toList();
    } else {
      revList = reviews;
    }
    return revList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: ('Review(${widget.reviews.length})'),
          actions: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Padding(
              padding: const EdgeInsets.only(right: kPadding),
              child: customText(
                  text: widget.rating.toString(), fontWeight: FontWeight.bold),
            )
          ]),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _reviewList(context),
          const SizedBox(height: 25,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _filterReview(ratingList[selectedRatingIndex], widget.reviews).length,
            itemBuilder: (context, index){
              return reviewItem(_filterReview(ratingList[selectedRatingIndex], widget.reviews)[index]);
          })
        ],
      )),
    );
  }

  Widget _reviewList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: SizedBox(
        height: 25,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: ratingList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 25.0),
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
      ),
    );
  }
}
