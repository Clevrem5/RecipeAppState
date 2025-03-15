import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp3/Core/data/models/reviews/models/review_comment_model.dart';

import '../../../../../Core/data/models/reviews/models/reviews_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final List<ReviewCommentsModel>? commentModel;
  final ReviewsRecipeModel? recipeModel;

  const ReviewsState({
    required this.recipeModel,
    required this.status,
    required this.commentModel,
  });

  ReviewsState copyWith({
    ReviewsRecipeModel? recipeModel,
    List<ReviewCommentsModel>? comment,
    ReviewsStatus? status,
  }) {
    return ReviewsState(
      recipeModel: recipeModel ?? this.recipeModel,
      commentModel: comment ?? this.commentModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [recipeModel, status,commentModel];
}
