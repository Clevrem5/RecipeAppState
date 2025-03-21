import 'package:recipeapp3/Core/client.dart';

import '../models/recipeModels/recipe_model.dart';

class TrendingRecipesRepository{
  final ApiClient client;

  TrendingRecipesRepository({required this.client,});

  RecipeModel? trendRecipe;

  Future<RecipeModel>fetchTrendingMain()async{
    final rawTrendMain=await client.genericGetRequest<dynamic>('/recipes/trending-recipe');
    trendRecipe=RecipeModel.fromJson(rawTrendMain);
    return trendRecipe!;
  }

  Future<List<RecipeModel>>fetchTrendingRecipes()async{
    final rawTrendRecipes=await client.genericGetRequest<List<dynamic>>('/recipes/trending-recipes');
    return rawTrendRecipes.map((e)=>RecipeModel.fromJson(e)).toList();
  }



}