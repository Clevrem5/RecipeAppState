import 'package:flutter/material.dart';

import '../../../../Core/data/models/categories_model.dart';
import '../../../../Core/data/repositories/categories_repository.dart';


class CategoriesEvent{}

class CategoriesLoading{}

class CategoriesBloc extends ChangeNotifier {
  CategoriesBloc({required CategoryRepository catRepo}) : _catRepo = catRepo {
    load();
  }

  final CategoryRepository _catRepo;

  List<CategoryModel> categories = [];
  CategoryModel? mainCategory;

  Future<void> load() async {
    final allCategories = await _catRepo.fetchCategories();
    mainCategory = allCategories.firstWhere((category) => category.isMain);
    categories = allCategories.where((category)=> !category.isMain).toList();
    notifyListeners();
  }
}