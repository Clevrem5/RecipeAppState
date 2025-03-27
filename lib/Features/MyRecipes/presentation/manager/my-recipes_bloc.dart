import 'package:bloc/bloc.dart';
import 'package:recipeapp3/Features/MyRecipes/presentation/manager/my-recipes_event.dart';
import 'package:recipeapp3/Features/MyRecipes/presentation/manager/my-recipes_state.dart';

import '../../../../Core/data/repositories/recipe_repository.dart';

class MyRecipesBloc extends Bloc<MyRecipesEvent, MyRecipesState> {
  final RecipeRepository _repo;

  MyRecipesBloc({required RecipeRepository repo})
      : _repo = repo,
        super(MyRecipesState.initial()) {
    on<MyRecipesLoad>(_load);
    add(MyRecipesLoad());
  }

  Future<void> _load(MyRecipesLoad event, Emitter<MyRecipesState> emit) async {
    emit(state.copyWith(status: MyRecipesStatus.loading));
    final recipe = await _repo.fetchMyRecipes();
    emit(state.copyWith(myRecipes: recipe, status: MyRecipesStatus.idle));
  }
}
