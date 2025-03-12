class ReviewsModel {
  final int id, userId, recipeId;
  final String comment, image, created, updated;
  final num rating;
  final bool recommend;
  final user, recipe;

  ReviewsModel({
    required this.id,
    required this.userId,
    required this.recipe,
    required this.comment,
    required this.image,
    required this.created,
    required this.rating,
    required this.recipeId,
    required this.recommend,
    required this.user,
    required this.updated,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      id: json['id'],
      userId: json['userId'],
      recipe: json['recipe'],
      comment: json['comment'],
      image: json['image'],
      created: json['created'],
      rating: json['rating'],
      recipeId: json['recipeId'],
      recommend: json['recommend'],
      user: json['user'],
      updated: json['updated'],
    );
  }
}
