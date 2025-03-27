import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/recipe_model.dart';

enum MyRecipesStatus { idle, loading, error }

class MyRecipesState extends Equatable {
  final List<RecipeModel>? myRecipes;
  final MyRecipesStatus? status;

  const MyRecipesState({
    required this.status,
    required this.myRecipes,
  });

  factory MyRecipesState.initial() {
    return MyRecipesState(
      status: MyRecipesStatus.loading,
      myRecipes: [],
    );
  }

  MyRecipesState copyWith({
    List<RecipeModel>? myRecipes,
    MyRecipesStatus? status,
  }) {
    return MyRecipesState(
      status: status ?? this.status,
      myRecipes: myRecipes ?? this.myRecipes,
    );
  }

  @override
  List<Object?> get props => [myRecipes,status];
}
