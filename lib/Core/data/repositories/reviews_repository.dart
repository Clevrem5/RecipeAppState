import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/models/reviews/models/review_comment_model.dart';

import '../models/reviews/models/reviews_model.dart';

class ReviewsRepository {
  final ApiClient client;

  ReviewsRepository({
    required this.client,
  });

  ReviewsRecipeModel? reviews;
  List<ReviewCommentsModel> reviewComment = [];

  Future<ReviewsRecipeModel> fetchReviews(int recipeId) async {
    if (reviews!=null) return reviews!;
    var rawReview = await client.fetchRecipeForReviews(recipeId);
    reviews=ReviewsRecipeModel.fromJson(rawReview);
    return reviews!;
  }

  Future<List<ReviewCommentsModel>> fetchReviewComment(int recipeId) async {
    if (reviewComment.isNotEmpty) return reviewComment;
    var rawComments = await client.fetchReviewComment(recipeId);
    reviewComment = rawComments.map((e) => ReviewCommentsModel.fromJson(e)).toList();
    return reviewComment;  }
}
