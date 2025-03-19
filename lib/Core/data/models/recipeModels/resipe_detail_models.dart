import 'package:recipeapp3/Core/data/models/recipeModels/instructionModel.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/recipeUser_model.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/recipe_detail-ingredients_model.dart';

class RecipeDetailModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String photo;
  final String videoRecipe;
  final int timeRequired;
  final num rating;
  final RecipeUserModel user;
  final List<InstructionModel> instructions;
  final List<IngredientsModel> ingredients;

  RecipeDetailModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photo,
    required this.videoRecipe,
    required this.timeRequired,
    required this.rating,
    required this.user,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      videoRecipe: json['videoRecipe'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      user: RecipeUserModel.fromJson(json['user']),
      ingredients: (json['ingredients'] as List<dynamic>).map((ingredients) => IngredientsModel.fromJson(ingredients)).toList(),
      instructions: (json['instructions'] as List<dynamic>).map((instructions) => InstructionModel.fromJson(instructions)).toList(),
    );
  }
}


/*
{
  "id": 0,
  "categoryId": 0,
  "title": "string",
  "description": "string",
  "photo": "string",
  "videoRecipe": "string",
  "timeRequired": 0,
  "rating": 0,
  "user": {
    "id": 0,
    "profilePhoto": "string",
    "username": "string",
    "firstName": "string",
    "lastName": "string"
  },
  "instructions": [
    {
      "text": "string",
      "order": 0
    }
  ],
  "ingredients": [
    {
      "amount": "string",
      "name": "string",
      "order": 0
    }
  ]
}
 */