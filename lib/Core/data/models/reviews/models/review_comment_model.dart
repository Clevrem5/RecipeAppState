import 'package:recipeapp3/Core/data/models/reviews/models/reviewCommentUsermodel.dart';

class ReviewCommentsModel{
  final int id;
  final String comment, image;
  final DateTime created;
  final num rating;
  final ReviewCommentUserModel user;

  ReviewCommentsModel({
    required this.image,
    required this.comment,
    required this.id,
    required this.user,
    required this.rating,
    required this.created,
  });

  factory ReviewCommentsModel.fromJson(Map<String, dynamic> json) {
    return ReviewCommentsModel(
      image: json['image'],
      comment: json['comment'],
      id: json['id'],
      created: DateTime.parse(json['created']),
      rating: json['rating'],
      user: ReviewCommentUserModel.fromJson(json['user']),
    );
  }
}