import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

class RecipeAddReviewContainer extends StatelessWidget {
  const RecipeAddReviewContainer({
    super.key,
  });

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
            child: Image.asset(
              'assets/images/lunch.png',
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
                  data: "Chicken Burger",
                  color: Colors.white,
                  size: 20.sp,
                  weight: FontWeight.w500,
                ), //title
                Row(
                  spacing: 5.w,
                  children: [
                    RecipeSvgButton(
                      svg: 'assets/icons/stars.svg',
                      width: 11.w,
                      height: 11.h,
                      size: 12.h,
                      color: Colors.white,
                      blend: true,
                      callback: () {},
                    ),
                    RecipeAppText(
                      data: "(456 Reviews)",
                      color: Colors.white,
                      size: 11.04.sp,
                    ),
                  ],
                ), //star
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/emily.png',
                        width: 32.19.w,
                        height: 33.24,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      children: [
                        RecipeAppText(
                          data: "@Andrew-Mar",
                          color: Colors.white,
                          height: true,
                          size: 13.76.sp,
                        ),
                        RecipeAppText(
                          data: "Andrew Martinez Chef",
                          color: Colors.white,
                          size: 13.76.sp,
                          height: true,
                          weight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ],
                ), //user
                ElevatedButton(
                  onPressed: () {},
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
