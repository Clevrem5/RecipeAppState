sealed class CreateRecipeEvent{}

final class AddIngredients extends CreateRecipeEvent{
  final int ingredients;
  AddIngredients({required this.ingredients});
}