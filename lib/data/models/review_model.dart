class ReviewModel {
  String userId;
  String userName;
  String userPicture;
  double rating;
  String description;
  DateTime createdAt;

  ReviewModel({
    required this.userId,
    required this.userName,
    required this.userPicture,
    required this.rating,
    required this.description,
    required this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userId: json['userId'],
      userName: json['userName'],
      userPicture: json['userPicture'],
      rating: json['rating'].toDouble(),
      description: json['description'],
      createdAt: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userPicture': userPicture,
      'rating': rating,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}