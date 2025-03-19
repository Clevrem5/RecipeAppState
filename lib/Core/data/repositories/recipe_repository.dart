import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/resipe_detail_models.dart';

import '../models/recipeModels/recipe_model.dart';

class RecipeRepository {
  final ApiClient client;

  RecipeRepository({required this.client});

  Map<int, List<RecipeModel>> recipeByCategory = {};

  RecipeDetailModel? recipeDetail;

  Future<List<RecipeModel>> fetchRecipeByCategory(int categoryId) async {
    if (recipeByCategory.containsKey(categoryId) && recipeByCategory[categoryId] != null) {
      return recipeByCategory[categoryId]!;
    }
    var rawRecipes = await client.fetchCommunityById(categoryId);
    final recipes = rawRecipes.map((e) => RecipeModel.fromJson(e)).toList();
    recipeByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<RecipeDetailModel> fetchRecipeById(int recipeId) async {
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipeDetail = RecipeDetailModel.fromJson(rawRecipe);
    return recipeDetail!;
  }


}
