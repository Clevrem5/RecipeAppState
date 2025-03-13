import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review_state.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/recipe_add_review_container.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/reviews_page_comments.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Reviews",
      ),
      body: BlocBuilder<ReviewsBloc, ReviewsState>(
        builder: (context, state) {
          return switch (state.status) {
            ReviewsStatus.idle => ListView(
                children: [
                  RecipeAddReviewContainer(recipe:state.recipeModel! ,),
                  SizedBox(height: 30.h),
                  ReviewsPageComments(),
                ],
            ),
            ReviewsStatus.loading => Center(
                child: CircularProgressIndicator(),
              ),
            ReviewsStatus.error => Center(
                child: Text("Something wrong?!..."),
              ),
          };
        },
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
