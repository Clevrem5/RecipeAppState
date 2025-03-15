import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/review_rating_star.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Leave A Review",
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(36.w, 0, 36.w, 100.h),
        children: [
          ReviewRatingStar(),
          SizedBox(height: 30.h),
          TextField(
            maxLines: 5,
            minLines: 3,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.pinkColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 16.h,
              ),
              hintText: "Leave us Review",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.45),
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          Row(
            children: [
              RecipeAppBarActionContainerButton(
                callback: () {},
                icon: 'assets/icons/add.svg',
                height: 9.h,
                width: 9.w,

              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
