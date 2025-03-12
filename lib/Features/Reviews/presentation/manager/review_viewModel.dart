import 'package:flutter/cupertino.dart';
import 'package:recipeapp3/Features/Reviews/data/models/reviews_model.dart';
import 'package:recipeapp3/Features/Reviews/data/repositories/reviews_repository.dart';

class ReviewViewModel with ChangeNotifier {
  final ReviewsRepository _repo;

  ReviewViewModel({
    required ReviewsRepository reviewRepo,
  }) : _repo = reviewRepo {
    load();
  }
  bool isLoading=true;
  List<ReviewsModel> review=[];

  Future<void>load()async{
    isLoading=true;
    notifyListeners();
    review=await _repo.fetchReviews();
    isLoading=false;
    notifyListeners();
  }


}
