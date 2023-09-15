import 'package:equatable/equatable.dart';
import 'package:prior_soft/data/models/review_model.dart';

abstract class GetReviewsState extends Equatable {}

class GetReviewsInitial extends GetReviewsState {
  @override
  List<Object?> get props => [];
}

class GetReviewsLoading extends GetReviewsState {
  @override
  List<Object?> get props => [];
}

class GetReviewsError extends GetReviewsState {
  @override
  List<Object?> get props => [];
}

class GetReviewsSuccess extends GetReviewsState {
  final List<ReviewModel> reviews;

  GetReviewsSuccess({required this.reviews});

  @override
  List<Object?> get props => [reviews];
}
