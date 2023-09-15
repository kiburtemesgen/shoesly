abstract class TopReviewsEvent {}

class GetTopReviews extends TopReviewsEvent{
  String productId;
  GetTopReviews({required this.productId});
}