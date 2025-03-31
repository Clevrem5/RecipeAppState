import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/instructionModel.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/recipe_detail-ingredients_model.dart';

enum CreateRecipeStatus {
  idle,
  loading,
  error,
}

class CreateRecipeState extends Equatable {
  final int? ingredients;
  final List<InstructionModel>? instruction;

  const CreateRecipeState({
    required this.ingredients,
    required this.instruction,
  });

  factory CreateRecipeState.initial() {
    return CreateRecipeState(
      ingredients: 1,
      instruction: [],
    );
  }

  CreateRecipeState copyWith({
    int? ingredients,
    List<InstructionModel>? instructions,
  }) {
    return CreateRecipeState(
      ingredients: ingredients ?? this.ingredients,
      instruction: instructions ?? this.instruction,
    );
  }

  @override
  List<Object?> get props => [ingredients,instruction];
}
