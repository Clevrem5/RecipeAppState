import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/profileModel.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/recipe_model.dart';

enum ProfileStatus { idle, success, loading, error }

class ProfileState extends Equatable {
  final List<RecipeModel>? recipes;
  final ProfileModel? profileModel;
  final ProfileStatus recipeStatus;
  final ProfileStatus profileStatus;

  const ProfileState({
    required this.profileModel,
    required this.recipes,
    required this.recipeStatus,
    required this.profileStatus,
  });

  factory ProfileState.initial() {
    return ProfileState(
      profileModel: null,
      recipes: [],
      recipeStatus: ProfileStatus.idle,
      profileStatus: ProfileStatus.idle,
    );
  }

  ProfileState copyWith({
    List<RecipeModel>? recipes,
    ProfileModel? profile,
    ProfileStatus? profileStatus,
    ProfileStatus? recipeStatus,
  }) {
    return ProfileState(
      profileModel: profile ?? this.profileModel,
      recipes: recipes ?? this.recipes,
      recipeStatus: recipeStatus ?? this.recipeStatus,
      profileStatus: profileStatus ?? this.profileStatus,
    );
  }

  @override
  List<Object?> get props => [recipeStatus, recipes, profileStatus, profileModel];
}
