import 'package:prior_soft/data/models/review_model.dart';

abstract class TopReviewsState {}

class TopReviewsInitial extends TopReviewsState {}

class TopReviewsLoading extends TopReviewsState {}

class TopReviewsError extends TopReviewsState {}

class TopReviewsSuccess extends TopReviewsState {
  List<ReviewModel> topReviews;
  TopReviewsSuccess({required this.topReviews});
}
