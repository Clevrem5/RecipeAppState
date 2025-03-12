import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Features/Reviews/data/models/reviews_model.dart';

class ReviewsRepository {
  final ApiClient client;

  ReviewsRepository({
    required this.client,
  });

  List<ReviewsModel> reviews = [];

  Future<List<ReviewsModel>> fetchReviews() async {
    if (reviews.isNotEmpty) return reviews;
    var rawReview = await client.fetchReviews();
    reviews = rawReview.map((e) => ReviewsModel.fromJson(e)).toList();
    return reviews;
  }
}
