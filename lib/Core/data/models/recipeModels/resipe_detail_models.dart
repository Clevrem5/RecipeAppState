import 'package:recipeapp3/Core/data/models/recipeModels/recipeUser_model.dart';

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
  });
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