import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Features/Reviews/data/models/reviews_model.dart';

class ReviewsRepository {
  final ApiClient client;

  ReviewsRepository({
    required this.client,
  });

  ReviewsRecipeModel? reviews ;

  Future<ReviewsRecipeModel> fetchReviews(int recipeId) async {
    if (reviews!=null) return reviews!;
    var rawReview = await client.fetchRecipeForReviews(recipeId);
    reviews=ReviewsRecipeModel.fromJson(rawReview);
    return reviews!;
  }
}
