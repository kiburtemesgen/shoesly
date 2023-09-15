abstract class GetReviewsEvent {}

class GetReview extends GetReviewsEvent {
  String productId;
  int rating;

  GetReview( {required this.productId,  required this.rating});
}
