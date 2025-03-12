import 'package:flutter/material.dart';

import '../../../Categories/data/models/categories_model.dart';
import '../../../Categories/data/repositories/categories_repository.dart';
import '../../data/models/recipe_model.dart';
import '../../data/repositories/recipe_repository.dart';

class CategoryDetailViewModel with ChangeNotifier {
  CategoryDetailViewModel({
    required CategoryRepository catRepo,
    required RecipeRepository recipeRepo,
    required CategoryModel selected,
  })  : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        _selected = selected {
    load();
  }

  final CategoryRepository _catRepo;
  final RecipeRepository _recipeRepo;

  List<CategoryModel> categories = [];
  List<RecipeModel> recipes = [];

  bool right = true;

  bool isLoading = true;

  late CategoryModel _selected;

  CategoryModel get selected => _selected;

  set selected(CategoryModel model) {
    if (categories.indexOf(_selected) < categories.indexOf(model)) {
      right = true;
    } else {
      right = false;
    }
    notifyListeners();

    _selected = model;
    notifyListeners();
    fetchRecipesByCategory(_selected.id);
  }

  Future<void> fetchRecipesByCategory(int categoryId) async {
    recipes = await _recipeRepo.fetchRecipeByCategory(categoryId);
    notifyListeners();
  }

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    categories = await _catRepo.fetchCategories();
    recipes = await _recipeRepo.fetchRecipeByCategory(selected.id);
    isLoading = false;
    notifyListeners();
  }
}
