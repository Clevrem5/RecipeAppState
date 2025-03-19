import 'package:flutter/material.dart';
import 'package:recipeapp3/Core/data/models/reviews/models/review_comment_model.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/recipe_reviews_comment.dart';

class ReviewsPageComments extends StatelessWidget {
  const ReviewsPageComments({
    super.key,
    required this.comment,
  });

  final ReviewCommentsModel comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: RecipeReviewsComment(comment: comment),
    );
  }
}
