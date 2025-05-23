import 'package:dio/dio.dart';
import 'package:recipeapp3/Core/data/models/profileModel.dart';
import 'package:recipeapp3/Core/data/models/reviews/create_reviewModel.dart';

import 'data/models/authmodel.dart';
import 'interseptor.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://192.168.9.155:8888/api/v1'),
  )..interceptors.add(AuthInterceptor()); // doim shu joyni o'zgartirib push qililar nolga sababini bilasizlar!!!

  Future<T> genericGetRequest<T>(String paths, {Map<String, dynamic>? queryParams}) async {
    var response = await dio.get(paths, queryParameters: queryParams);
    return response.data as T;
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("categoriesda data kelmadi");
    }
  }

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      "/auth/login",
      data: {"login": login, 'password': password},
    );
    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Login xato");
    }
  } //login

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post(
      '/auth/register',
      data: model.toJson(),
    );
    print("malumot bor ${response.data}");
    return response.statusCode == 201 ? true : false;
  } //signUp

  Future<List<dynamic>> fetchCommunity(int limit, String order, bool descending) async {
    var response = await dio.get('/recipes/community/list?Limit=$limit&Order=$order&Descending=$descending');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("malumot yo'q communitida");
    }
  }

  Future<List<dynamic>> fetchCommunityById(int categoryId) async {
    var response = await dio.get('/recipes/list?category=$categoryId');
    return response.statusCode == 200 ? response.data : Exception("ma'lumot kelmadi");
  }

  Future<Map<String, dynamic>> fetchRecipeForReviews(int recipeId) async {
    var response = await dio.get('/recipes/reviews/detail/$recipeId');
    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(response.data);
    } else {
      throw Exception("recipes/reviews/detail/$recipeId so'rovimiz xato ketti!");
    }
  }

  Future<List<dynamic>> fetchReviewComment(int recipeId) async {
    var response = await dio.get('/reviews/list?recipeId=$recipeId');

    return response.statusCode == 200 ? response.data : Exception("Ma'lumot kelmadi");
  }

  Future<Map<String, dynamic>> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('/recipes/detail/$recipeId sorovimiz xato ketti');
    }
  }

  Future<bool> createReview(CreateReviewModel model) async {
    final formdata = FormData.fromMap(await model.toJson());
    final response = await dio.post(
      '/reviews/create',
      options: Options(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVtaWx5QGdtYWlsLmNvbSIsImp0aSI6Ijg3MTUxYTRlLTViMmYtNGViYy1hYmU4LTQzZmExYzM2YzZlNSIsInVzZXJpZCI6IjUiLCJleHAiOjE4MzY5MTc5MjcsImlzcyI6ImxvY2FsaG9zdCIsImF1ZCI6ImF1ZGllbmNlIn0.UY2a5qRKT2dUfNq6BsBT6rvxQg-medYeEoAb24fPSG0",
        },
      ),
      data: formdata,
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchTopChefsForHome({int? limit}) async {
    final response = await dio.get('/auth/top-chefs?Limit=${limit ?? ''}');
    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("/auth/top-chefs?Limit=${limit ?? ''} so'rovimiz xato ketti");
    }
  }

  Future<List<dynamic>> fetchRecipes(int userId) async {
    var response = await dio.get('/recipes/list?UserId=$userId');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }
    throw Exception("xato bor recipe kelishida");
  }
  Future<List<dynamic>> fetchProfileRecipes(ProfileModel userId) async {
    var response = await dio.get('/recipes/list?UserId=$userId');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }
    throw Exception("xato bor recipe kelishida");
  }
  Future<List<dynamic>>fetchFollowers(int id)async{
    final response=await dio.get('/auth/followers/$id');
    if (response.statusCode==200){
      return List.from(response.data);
    }else{
      throw Exception('followers xato ketdi');
    }
  }
  Future<List<dynamic>>fetchFollowings(int id)async{
    final response=await dio.get('/auth/followings/$id');
    if (response.statusCode==200){
      return List.from(response.data);
    }else{
      throw Exception('followings xato ketdi');
    }
  }
  Future<int> fetchFollowId(int id) async {
    final response = await dio.post('/auth/follow/$id');

    if (response.statusCode == 200) {
      if (response.data is int) {
        return response.data; // ✅ Agar int bo‘lsa, to‘g‘ridan-to‘g‘ri qaytaramiz
      } else if (response.data is String) {
        return int.tryParse(response.data) ?? 0; // ✅ String bo‘lsa, int ga o‘tkazamiz
      } else {
        throw Exception("Noto‘g‘ri data turi: ${response.data}");
      }
    } else {
      throw Exception("Server xatosi: ${response.statusCode}");
    }
  }
  Future<int> fetchDeleteId(int id) async {
    final response = await dio.post('/auth/remove-follower/$id');

    if (response.statusCode == 200) {
      if (response.data is int) {
        return response.data; // ✅ Agar int bo‘lsa, to‘g‘ridan-to‘g‘ri qaytaramiz
      } else if (response.data is String) {
        return int.tryParse(response.data) ?? 0; // ✅ String bo‘lsa, int ga o‘tkazamiz
      } else {
        throw Exception("Noto‘g‘ri data turi: ${response.data}");
      }
    } else {
      throw Exception("Server xatosi: ${response.statusCode}");
    }
  }
  Future<int> fetchUnFollowId(int id) async {
    final response = await dio.post('/auth/unfollow/$id');

    if (response.statusCode == 200) {
      if (response.data is int) {
        return response.data; // ✅ Agar int bo‘lsa, to‘g‘ridan-to‘g‘ri qaytaramiz
      } else if (response.data is String) {
        return int.tryParse(response.data) ?? 0; // ✅ String bo‘lsa, int ga o‘tkazamiz
      } else {
        throw Exception("Noto‘g‘ri data turi: ${response.data}");
      }
    } else {
      throw Exception("Server xatosi: ${response.statusCode}");
    }
  }

}
