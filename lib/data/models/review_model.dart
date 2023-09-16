class ReviewModel {
  String productId;
  String userName;
  String userPicture;
  double rating;
  String description;
  DateTime createdAt;

  ReviewModel({
    required this.productId,
    required this.userName,
    required this.userPicture,
    required this.rating,
    required this.description,
    required this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      productId: json['productId'],
      userName: json['userName'],
      userPicture: json['userPicture'],
      rating: json['rating'].toDouble(),
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'userName': userName,
      'userPicture': userPicture,
      'rating': rating,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}