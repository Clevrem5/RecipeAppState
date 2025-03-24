import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review/review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/recipe_add_review_container.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/reviews_page_comments.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../../../Core/utils/colors.dart';
import '../../../zeroCommon/body/recipe_app_text.dart';
import '../manager/review/review_state.dart';

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
            ReviewsStatus.idle => Column(
                children: [
                  RecipeAddReviewContainer(recipe:state.recipeModel!,),
                  SizedBox(height: 30.h),
                  Expanded(
                    child: Column(
                      spacing: 15.h,
                      children: [
                        RecipeAppText(
                          data: "Comments",
                          color: AppColors.redPinkMain,
                          size: 15.sp,line: 1,
                          weight: FontWeight.w500,
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.commentModel!.length,
                            itemBuilder:(context, index) =>  ReviewsPageComments(
                              comment: state.commentModel![index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
