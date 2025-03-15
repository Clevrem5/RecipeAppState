import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp3/Core/data/repositories/reviews_repository.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review/review_state.dart';

part 'review_event.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc({
    required ReviewsRepository recipeRepo,
    required int recipeId,
  })  : _recipeRepo = recipeRepo,
        super(
          ReviewsState(
            recipeModel: null,
            commentModel: null,
            status: ReviewsStatus.loading,
          ),
        ) {
    on<ReviewsLoading>(_onLoad);
    add(ReviewsLoading(recipeId: recipeId,));
  }

  final ReviewsRepository _recipeRepo;

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    final recipe = await _recipeRepo.fetchReviews(event.recipeId);
    final comment = await _recipeRepo.fetchReviewComment(event.recipeId);
    emit(state.copyWith(recipeModel: recipe,comment: comment,status: ReviewsStatus.idle));
  }
}
