import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/create%20review/create_review_review_section.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/create_review_add_photo.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/review_rating_star.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../../../../Core/navigation/paths.dart';
import '../../../../Core/utils/colors.dart';
import '../../../zeroCommon/body/recipe_textButton.dart';
import '../manager/create_review/create_review_bloc.dart';
import '../manager/create_review/create_review_state.dart';
import '../widgets/create review/create_recipe_section.dart';
import '../widgets/create review/create_review_cansel_submitSection.dart';
import '../widgets/create review/create_review_recomment_section.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: "Leave A Review"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: BlocListener<CreateReviewBloc, CreateReviewState>(
          listener: (context, state) async {
            // nothing
            if (state.status == CreateReviewStatus.submitted) {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Center(
                    child: Dialog(
                      backgroundColor: Colors.white,
                      child: Container(
                        width: 276.w,
                        height: 359.h,
                        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 36.h),
                        child: Column(
                          spacing: 20.h,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 170.w,
                              child: Text(
                                "Thank you for your Review!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.beigeColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SvgPicture.asset("assets/icons/big-tick.svg"),
                            Text(
                              "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.beigeColor,
                                fontSize: 13,
                              ),
                            ),
                            RecipeTextButtonContainer(
                              text: "Go Back",
                              textColor: Colors.white,
                              containerColor: AppColors.redPinkMain,
                              containerWidth: 207.w,
                              containerHeight: 45.h,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              callback: () => context.pop(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
              if (context.mounted) {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(Routes.getReviews(state.recipeModel!.id));
                }
              }
            }
          },
          child: ListView(
            padding:EdgeInsets.only(bottom: 150,),
            children: [
              const CreateReviewRecipeSection(),
              SizedBox(height: 23.h),
              const ReviewRatingStar(),
              SizedBox(height: 28.h),
              CreateReviewReviewSection(),
              SizedBox(height: 10.h),
             const CreateReviewAddPhoto(),
              SizedBox(height: 23.h),
              const CreateReviewRecommendSection(),
              Spacer(),
              const CreateReviewCancelAndSubmitSection(),
              SizedBox(height: 120.h)
            ],
          ),
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}