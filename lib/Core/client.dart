import 'package:dio/dio.dart';

class ApiClient{
  final Dio dio=Dio(BaseOptions(baseUrl:'http://192.168.9.155:8888/api/v1'));

  Future<List<dynamic>>fetchCategories()async{
    var response=await dio.get('/categories/list');
    if (response.statusCode==200){
      List<dynamic>data=response.data;
      return data;
    }else{
      throw Exception("categoriesda data kelmadi");
    }
  }
  Future<List<dynamic>>fetchCommunity(int limit,String order,bool descending)async{
    var response=await dio.get('/recipes/community/list?Limit=$limit&Order=$order&Descending=$descending');
    if(response.statusCode==200){
      List<dynamic>data=response.data;
      return data;
    }else{
      throw Exception("malumot yo'q communitida");
    }
  }
  Future<List<dynamic>>fetchCommunityById(int categoryId)async{
    var response=await dio.get('/recipes/list?category=$categoryId');
    return response.statusCode==200?response.data:Exception("ma'lumot kelmadi");

  }
  Future<Map<String, dynamic>> fetchRecipeForReviews(int recipeId) async {
    var response = await dio.get('/recipes/reviews/detail/$recipeId');
    if (response.statusCode == 200){
      return Map<String, dynamic>.from(response.data);
    } else{
      throw Exception("recipes/reviews/detail/$recipeId so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>>fetchReviewComment(int recipeId)async{
    var response=await dio.get('/reviews/list?recipe=$recipeId');
    return response.statusCode==200?response.data:Exception("Ma'lumot kelmadi");

  }



}