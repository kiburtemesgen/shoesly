class ReviewModel {
  String
      userId; //Since they have 1 to 1 relationship, We need to relate the review model with user ID so it will be easy to fetch the user detail
  String userName;
  String userPicture;
  double rating;
  String description;
  DateTime date;

  ReviewModel(
      {required this.userId,
      required this.userName,
      required this.userPicture,
      required this.rating,
      required this.description,
      required this.date});
}
