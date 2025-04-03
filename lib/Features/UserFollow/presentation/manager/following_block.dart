part of 'following_event.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  final ProfileRepository _repo;

  FollowBloc({
    required ProfileRepository repo,
  })  : _repo = repo,
        super(FollowState.initial()) {
    on<FollowLoad>(_load);
    on<FollowUser>(_followUser);
  }

  Future<void> _load(FollowLoad event, Emitter<FollowState> emit) async {
    emit(state.copyWith(followStatus: FollowStatus.loading, followingStatus: FollowStatus.loading));
    final followers = await _repo.fetchFollowers(event.id);
    emit(state.copyWith(follower: followers, followStatus: FollowStatus.success));
    final followings = await _repo.fetchFollowings(event.id);
    emit(state.copyWith(followings: followings, followingStatus: FollowStatus.success));
  }

  Future<void> _followUser(FollowUser event, Emitter<FollowState> emit) async {
    emit(state.copyWith(followUserStatus: FollowStatus.loading));
    int userId = await _repo.fetchFollowUser(event.userId);
    emit(state.copyWith(followUser: userId, followUserStatus: FollowStatus.success));
  }
}
