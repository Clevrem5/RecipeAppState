import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp3/Core/data/repositories/profile_repository.dart';
import 'package:recipeapp3/Features/UserFollow/presentation/manager/following_state.dart';

part 'following_block.dart';

sealed class FollowEvent{}

final class FollowLoad extends FollowEvent{
  final int id;
  FollowLoad({required this.id});
}