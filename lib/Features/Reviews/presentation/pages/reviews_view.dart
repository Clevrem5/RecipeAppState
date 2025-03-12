import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review_viewModel.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/recipe_add_review_container.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ReviewViewModel>();
    if (vm.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Reviews",
        toolbarHeight: 100,
      ),
      body: ListView(
        children: [
          RecipeAddReviewContainer(),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeAppText(
                  data: "Comments",
                  color: AppColors.redPinkMain,
                  size: 15.sp,
                  weight: FontWeight.w500,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 7.w,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/andrew.png',
                            width: 46.w,
                            height: 42.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          spacing: 90,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RecipeAppText(
                              data: '@r_joshua',
                              color: AppColors.redPinkMain,
                              size: 15.sp,
                            ),
                            RecipeAppText(
                              data: '(15 Mins Ago)',
                              color: AppColors.redPinkMain,
                              size: 15.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 19.h),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "\nPraesent fringilla eleifend purus vel dignissim. Praesent \n"
                      "urna ante, iaculis at lobortis eu.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    RecipeSvgButton(
                      svg: 'assets/icons/stars.svg',
                      width: 142.w,
                      height: 15.26.h,
                      size: 16.h,
                      color: AppColors.redPinkMain,
                      callback: () {},
                    ),
                    SizedBox(height: 25.h),
                    Divider(color: AppColors.pinkSub,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
