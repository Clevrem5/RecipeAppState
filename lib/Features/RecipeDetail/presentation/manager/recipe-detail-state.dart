import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/resipe_detail_models.dart';

enum RecipeDetailStatus { initial, idle, loading, error }

class RecipeDetailState extends Equatable {
  final RecipeDetailStatus? status;
  final RecipeDetailModel? recipes;

  const RecipeDetailState({required this.status, required this.recipes});

  RecipeDetailState copyWith({RecipeDetailModel? recipe, RecipeDetailStatus? status}) {
    return RecipeDetailState(
      status: status ?? this.status,
      recipes: recipe ?? recipes,
    );
  }

  @override
  List<Object?> get props => [status, recipes];
}
