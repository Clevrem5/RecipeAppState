import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

class ReviewsPageComments extends StatelessWidget {
  const ReviewsPageComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                sizeHeight: 16.h,
                sizeWidth: 93.w,
                color: AppColors.redPinkMain,
                callback: () {},
              ),
              SizedBox(height: 25.h),
              Divider(
                color: AppColors.pinkSub,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
