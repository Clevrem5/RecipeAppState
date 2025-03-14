import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/create_review/create_review_state.dart';
import 'create_review_event.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  CreateReviewBloc()
      : super(
          CreateReviewState(
            recipeId: null,
            currentIndex: null,
            status: CreateReviewStatus.loading,
          ),
        ) {
    on<CreateReviewRate>(_onRate);
  }

  Future<void> _onRate(CreateReviewRate event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(currentIndex: event.currentIndex, status: CreateReviewStatus.idle));
  }
}
