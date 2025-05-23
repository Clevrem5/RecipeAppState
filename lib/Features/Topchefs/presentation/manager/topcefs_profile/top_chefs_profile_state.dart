import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/recipe_model.dart';

import '../../../../../Core/data/models/profileModel.dart';

enum TopChefsProfileStatus { idle, loading, success, error }

class TopChefsProfileState extends Equatable {
  final List<RecipeModel> recipes;
  final TopChefsProfileStatus recipeStatus;
  final ProfileModel? userInfo;
  final TopChefsProfileStatus profileStatus;

  const TopChefsProfileState({
    required this.profileStatus,
    required this.recipes,
    required this.userInfo,
    required this.recipeStatus,
  });

  factory TopChefsProfileState.initial() {
    return TopChefsProfileState(
      profileStatus: TopChefsProfileStatus.loading,
      recipes: [],
      userInfo: null,
      recipeStatus: TopChefsProfileStatus.loading,
    );
  }

  TopChefsProfileState copyWith({
    List<RecipeModel>? recipe,
    ProfileModel? profile,
    TopChefsProfileStatus? profileStatus,
    TopChefsProfileStatus? recipeStatus,
  }) {
    return TopChefsProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      recipes: recipe ?? recipes,
      userInfo: profile ?? userInfo,
      recipeStatus: recipeStatus ?? this.recipeStatus,
    );
  }

  @override
  List<Object?> get props => [profileStatus, recipes, userInfo, recipeStatus];
}
