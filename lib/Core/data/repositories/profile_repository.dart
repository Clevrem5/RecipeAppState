import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/models/profileModel.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/recipe_model.dart';

class ProfileRepository{
  final ApiClient client;
  ProfileRepository({required this.client});

  List<RecipeModel> myRecipes=[];
  ProfileModel? aboutUser;

  Future<ProfileModel>fetchUserInfo()async{
   var  rawUser= await client.genericGetRequest("/auth/me");
    aboutUser=ProfileModel.fromJson(rawUser);
    return aboutUser!;
  }

  Future<List<RecipeModel>>fetchProfileRecipes(int userId)async{
    var rawRecipes=await client.fetchRecipes(userId);
    myRecipes=rawRecipes.map((e)=>RecipeModel.fromJson(e)).toList();
    return myRecipes;
  }

}