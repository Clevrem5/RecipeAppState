import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/topchefs_model.dart';

enum FollowStatus { idle, success, loading, error }

class FollowState extends Equatable {
  final List<TopChefModel>? followers;
  final List<TopChefModel>? followings;

  final FollowStatus? followStatus;
  final FollowStatus? followingStatus;

  const FollowState({
    required this.followers,
    required this.followings,
    required this.followStatus,
    required this.followingStatus,
  });

  factory FollowState.initial() {
    return FollowState(
      followers: [],
      followings: [],
      followStatus: FollowStatus.loading,
      followingStatus: FollowStatus.loading,
    );
  }

  FollowState copyWith({
    List<TopChefModel>? follower,
    List<TopChefModel>? followings,
    FollowStatus? followStatus,
    FollowStatus? followingStatus,
  }) {
    return FollowState(
      followers: follower ?? this.followers,
      followings: followings ?? this.followings,
      followStatus: followStatus ?? this.followStatus,
      followingStatus: followingStatus ?? this.followingStatus,
    );
  }

  @override
  List<Object?> get props => [
        followStatus,
        followers,
        followings,
        followingStatus,
      ];
}
