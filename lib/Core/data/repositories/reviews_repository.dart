import 'dart:io';

import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/models/reviews/models/recipe_create_review_model.dart';
import 'package:recipeapp3/Core/data/models/reviews/models/review_comment_model.dart';

import '../models/reviews/create_reviewModel.dart';
import '../models/reviews/models/reviews_model.dart';

class ReviewsRepository {
  final ApiClient client;

  ReviewsRepository({
    required this.client,
  });

  ReviewsRecipeModel? reviews;
  List<ReviewCommentsModel> reviewComment = [];
  RecipeCreateReviewModel? create;

  Future<ReviewsRecipeModel> fetchReviews(int recipeId) async {
    var rawReview = await client.fetchRecipeForReviews(recipeId);
    reviews = ReviewsRecipeModel.fromJson(rawReview);
    return reviews!;
  }

  Future<List<ReviewCommentsModel>> fetchReviewComment(int recipeId) async {
    var rawComments = await client.fetchReviewComment(recipeId);
    reviewComment = rawComments.map((e) => ReviewCommentsModel.fromJson(e)).toList();
    return reviewComment;
  }

  Future<RecipeCreateReviewModel> fetchCreateReview(int recipeId) async {
    final rawRecipes = await client.genericGetRequest<dynamic>('/recipes/create-review/$recipeId');
    create=RecipeCreateReviewModel.fromJson(rawRecipes);
    return create!;
  }

  Future<bool> createReview({
    required int recipeId,
    required int rating,
    required String comment,
    required bool recommend,
    File? photo,
  }) async {
    final reviewModel = CreateReviewModel(
      recipeId: recipeId,
      comment: comment,
      recommend: recommend,
      rating: rating,
      photo: photo,
    );
    final result = await client.createReview(reviewModel);
    return result;
  }


}
