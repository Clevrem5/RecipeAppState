import 'package:bloc/bloc.dart';
import 'package:recipeapp3/Core/data/repositories/profile_repository.dart';
import 'package:recipeapp3/Features/Profile/presentation/manager/profile_event.dart';
import 'package:recipeapp3/Features/Profile/presentation/manager/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repo;
  final int userId;

  ProfileBloc({required ProfileRepository repo,required this.userId,})
      : _repo = repo,
        super(
          ProfileState.initial(),
        ) {
    on<ProfileLoading>(_load);
    add(ProfileLoading());
  }

  Future<void> _load(ProfileLoading event, Emitter<ProfileState> emit) async {
    state.copyWith(
      recipeStatus: ProfileStatus.loading,
      profileStatus: ProfileStatus.loading,
    );
    final profile = await _repo.fetchUserInfo(userId);
    state.copyWith(profile: profile, profileStatus: ProfileStatus.success);
    final recipes = await _repo.fetchProfileRecipes(userId);
    state.copyWith(recipes: recipes, recipeStatus: ProfileStatus.success);
  }
}
