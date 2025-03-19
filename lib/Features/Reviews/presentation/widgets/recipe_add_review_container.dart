import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/navigation/paths.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

import '../../../../Core/data/models/reviews/models/reviews_model.dart';

class RecipeAddReviewContainer extends StatelessWidget {
  const RecipeAddReviewContainer({
    super.key, required this.recipe,
  });
  final ReviewsRecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 223.25.h,
      padding: EdgeInsets.symmetric(
        horizontal: 31.w,
        vertical: 30.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              recipe.image,
              // 'assets/images/lunch.png',
              width: 162.27.w,
              height: 163.25.h,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeAppText(
                  data: recipe.title,
                  color: Colors.white,
                  size: 20.sp,
                  weight: FontWeight.w500,
                ), //title
                Row(
                  spacing: 5.w,
                  children: [
                    RecipeSvgButton(
                      svg: 'assets/icons/stars.svg',
                      width: 72.w,
                      height: 11.h,
                      sizeHeight: 12.h,
                      sizeWidth: 72.w,
                      color: Colors.white,
                      blend: true,
                      callback: () {},
                    ),
                    RecipeAppText(
                      data: '(${recipe.reviewsCount.toString()} views)',
                      color: Colors.white,
                      size: 11.04.sp,
                    ),
                  ],
                ), //star
                Row(spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(recipe.user.userPhoto),
                        radius: 16,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      children: [
                        RecipeAppText(
                          data: '@${recipe.user.username}',
                          color: Colors.white,
                          height: 1,
                          size: 13.76.sp,
                        ),
                        RecipeAppText(
                          data: recipe.user.lastName,
                          color: Colors.white,
                          size: 13.76.sp,
                          height: 1,
                          weight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ],
                ), //user
                ElevatedButton(
                  onPressed: () {
                    context.push(Routes.getCreateReviews(recipe.id));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    alignment: Alignment.center,
                    minimumSize: Size(126.w, 28.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: RecipeAppText(
                    data: "Add Review",
                    color: AppColors.redPinkMain,
                    size: 15.sp,
                    weight: FontWeight.w500,
                  ),
                ), //add
              ],
            ),
          ),
        ],
      ),
    );
  }
}
