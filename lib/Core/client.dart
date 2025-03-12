import 'package:dio/dio.dart';

class ApiClient{
  final Dio dio=Dio(BaseOptions(baseUrl:'http://192.168.8.226:8888/api/v1'));

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
  Future<List<dynamic>>fetchReviews()async{
    var response=await dio.get('/reviews/list');
    List<dynamic>data=response.data;
    if (response.statusCode==200){
      return data;
    }else{
      throw Exception("Ma'lumot kelmadi");
    }
  }

}