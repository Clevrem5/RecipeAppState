import 'package:recipeapp3/Core/client.dart';

import '../models/recipe_model.dart';

class RecipeRepository {
  final ApiClient client;

  RecipeRepository({required this.client});

  Map<int, List<RecipeModel>> recipeByCategory = {};

  Future<List<RecipeModel>> fetchRecipeByCategory(int categoryId) async {
    if (recipeByCategory.containsKey(categoryId) && recipeByCategory[categoryId] != null) {
      return recipeByCategory[categoryId]!;
    }
    var rawRecipes = await client.fetchCommunityById(categoryId);
    final recipes = rawRecipes.map((e) => RecipeModel.fromJson(e)).toList();
    recipeByCategory[categoryId] = recipes;
    return recipes;
  }
}
