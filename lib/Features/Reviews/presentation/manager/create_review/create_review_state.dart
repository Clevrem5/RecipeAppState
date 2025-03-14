import 'package:equatable/equatable.dart';

enum CreateReviewStatus { idle, loading, error }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;

  const CreateReviewState({
    required this.recipeId,
    required this.currentIndex,
    required this.status,
  });

  CreateReviewState copyWith({
    int? recipeId,
    int? currentIndex,
    CreateReviewStatus? status,
  }) {
    return CreateReviewState(
      recipeId: recipeId ?? this.recipeId,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [recipeId, currentIndex, status];
}
