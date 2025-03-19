import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/reviews/models/recipe_create_review_model.dart';

enum CreateReviewStatus { idle, loading, error, submitted }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;
  final bool? doesRecommend;
  final RecipeCreateReviewModel? recipe;
  final File? pickImage;

  const CreateReviewState({
    required this.recipeId,
    required this.currentIndex,
    required this.status,
    required this.pickImage,
    required this.recipe,
    required this.doesRecommend,
  });

  factory CreateReviewState.initial() {
    return CreateReviewState(
      recipeId: null,
      currentIndex: null,
      status: CreateReviewStatus.loading,
      pickImage: null,
      recipe: null,
      doesRecommend: null,
    );
  }

  CreateReviewState copyWith({
    int? recipeId,
    int? currentIndex,
    CreateReviewStatus? status,
    File? pickedImage,
    bool? doesRecommend,
    RecipeCreateReviewModel? recipes,
  }) {
    return CreateReviewState(
      recipeId: recipeId ?? this.recipeId,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
      pickImage: pickedImage ?? this.pickImage,
      doesRecommend: doesRecommend ?? this.doesRecommend,
      recipe: recipes ?? this.recipe,
    );
  }

  @override
  List<Object?> get props => [
        recipeId,
        currentIndex,
        status,
        recipe,
        pickImage,
        doesRecommend,
      ];
}
