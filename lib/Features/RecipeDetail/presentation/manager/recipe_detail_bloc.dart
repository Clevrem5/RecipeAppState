import 'package:bloc/bloc.dart';
import 'package:recipeapp3/Core/data/repositories/recipe_repository.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipe-detail-state.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipe_detail_event.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {
  final RecipeRepository _repo;
  final int recipeId;

  RecipeDetailBloc({required RecipeRepository repo, required this.recipeId})
      : _repo = repo,
        super(
          RecipeDetailState(
            status: RecipeDetailStatus.loading,
            recipes: null,
          ),
        ) {
    on<RecipeDetailLoad>(_onLoad);
    add(RecipeDetailLoad(
      recipeId: recipeId));
  }

  Future<void> _onLoad(RecipeDetailLoad event, Emitter<RecipeDetailState> emit) async {
    emit(state.copyWith(status: RecipeDetailStatus.loading));
    final recipe = await _repo.fetchRecipeById(event.recipeId);
    emit(state.copyWith(recipe: recipe, status: RecipeDetailStatus.idle));
  }
}
