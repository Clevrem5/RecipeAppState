import 'package:dio/dio.dart';
import 'package:recipeapp3/Core/data/models/reviews/create_reviewModel.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.9.155:8888/api/v1'));

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
}
