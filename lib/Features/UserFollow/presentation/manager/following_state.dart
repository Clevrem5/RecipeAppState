import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/topchefs_model.dart';

enum FollowStatus { idle, success, loading, error }

class FollowState extends Equatable {
  final List<TopChefModel>? followers;
  final List<TopChefModel>? followings;

  final FollowStatus? followStatus;
  final FollowStatus? followingStatus;
  final FollowStatus? followUserStatus;

  final int followUser;

  const FollowState({
    required this.followers,
    required this.followings,
    required this.followStatus,
    required this.followingStatus,
    required this.followUser,
    required this.followUserStatus,
  });

  factory FollowState.initial() {
    return FollowState(
      followers: [],
      followings: [],
      followUser: 0,
      followStatus: FollowStatus.loading,
      followingStatus: FollowStatus.loading,
      followUserStatus: FollowStatus.idle,
    );
  }

  FollowState copyWith({
    List<TopChefModel>? follower,
    List<TopChefModel>? followings,
    FollowStatus? followStatus,
    FollowStatus? followingStatus,
    FollowStatus? followUserStatus,
    int? followUser,
  }) {
    return FollowState(
      followers: follower ?? this.followers,
      followings: followings ?? this.followings,
      followStatus: followStatus ?? this.followStatus,
      followingStatus: followingStatus ?? this.followingStatus,
      followUser: followUser ?? this.followUser,
      followUserStatus: followUserStatus ?? this.followUserStatus, // ✅ Saqlanadi
    );
  }

  @override
  List<Object?> get props => [
    followStatus,
    followers,
    followings,
    followingStatus,
    followUser,
    followUserStatus,
  ];
}
