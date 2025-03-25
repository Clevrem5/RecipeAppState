import 'package:bloc/bloc.dart';
import 'package:recipeapp3/Core/data/repositories/recipe_repository.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_event.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_state.dart';

import '../../../../../Core/data/repositories/profile_repository.dart';

class TopChefsProfileBloc extends Bloc<TopChefsProfileEvent, TopChefsProfileState> {
  final ProfileRepository _userRepo;

  TopChefsProfileBloc({
    required RecipeRepository recipeRepo,
    required ProfileRepository userRepo,
  })  :
        _userRepo = userRepo,
        super(TopChefsProfileState.initial()) {
    on<TopChefsProfileLoading>(_load);
  }

  Future<void> _load(TopChefsProfileLoading event, Emitter<TopChefsProfileState> emit) async {
    emit(state.copyWith(
      recipeStatus: TopChefsProfileStatus.loading,
      profileStatus: TopChefsProfileStatus.loading,
    ));
    final user=await _userRepo.fetchUserInfo();
    emit(state.copyWith(profile: user,profileStatus: TopChefsProfileStatus.success));
    final recipe=await _userRepo.fetchProfileRecipes(event.userId);
    emit(state.copyWith(recipe: recipe,recipeStatus: TopChefsProfileStatus.success));
  }
}
