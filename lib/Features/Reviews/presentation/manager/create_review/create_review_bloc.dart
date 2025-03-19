import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipeapp3/Core/data/repositories/reviews_repository.dart';

import 'create_review_event.dart';
import 'create_review_state.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  CreateReviewBloc({
    required ReviewsRepository reviewRepo,
  })  :
        _reviewRepo = reviewRepo,
        super(CreateReviewState.initial()) {
    on<CreateReviewRate>(_onRate);
    on<CreateReviewPickImage>(_onPickImage);
    on<CreateReviewYesOrNot>(_onRecommendOrNot);
    on<CreateReviewLoad>(_onLoad);
    on<CreateReviewSubmit>(_onSubmit);
  }

  final ReviewsRepository _reviewRepo;
  final reviewController = TextEditingController();

  @override
  Future<void> close() {
    reviewController.dispose();
    return super.close();
  }

  Future _onLoad(CreateReviewLoad event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(status: CreateReviewStatus.loading, recipeId: event.recipeId));
    final recipe = await _reviewRepo.fetchCreateReview(event.recipeId);
    emit(state.copyWith(recipes: recipe, status: CreateReviewStatus.idle));
  }

  Future<void> _onRate(CreateReviewRate event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }

  Future<void> _onPickImage(CreateReviewPickImage event, Emitter<CreateReviewState> emit) async {
    File? image;
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(state.copyWith(pickedImage: image));
    }
  }

  Future<void> _onRecommendOrNot(CreateReviewYesOrNot event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(doesRecommend: event.value));
  }

  Future _onSubmit(CreateReviewSubmit event, Emitter<CreateReviewState> emit) async {
    final successful = await _reviewRepo.createReview(
      recipeId: state.recipeId!,
      rating: state.currentIndex! + 1,
      comment: reviewController.text,
      recommend: state.doesRecommend!,
      photo: state.pickImage,
    );
    if (successful) {
      emit(state.copyWith(status: CreateReviewStatus.submitted));
    } else {
      emit(state.copyWith(status: CreateReviewStatus.error));
    }
  }
}
