
abstract class RecipeDetailEvent{}

final class RecipeDetailLoad extends RecipeDetailEvent{
  final int recipeId;
  RecipeDetailLoad({required this.recipeId,});
}