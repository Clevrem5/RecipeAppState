import 'package:flutter/cupertino.dart';

import '../../../../Core/data/models/recipeModels/resipe_detail_models.dart';
import '../../../../Core/data/repositories/recipe_repository.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel({
    required RecipeRepository recipeRepo,
    required this.recipeId,
  }) : _recipeRepo = recipeRepo {
    load();
  }

  final RecipeRepository _recipeRepo;
  bool isLoading = true;
  final int recipeId;

  late final RecipeDetailModel recipe;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    recipe = await _recipeRepo.fetchRecipeById(recipeId);
    isLoading = false;
    notifyListeners();
  }
}