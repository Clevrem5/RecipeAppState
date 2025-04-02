import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_textButton.dart';

import '../../../../Core/utils/colors.dart';
import '../../../Topchefs/presentation/widgets/recipe_app_follow_button.dart';

class FollowerPartUsers extends StatelessWidget {
  const FollowerPartUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'assets/images/lunch.png',
            width: 61.w,
            height: 63.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 132.w,
          height: 60.h,
          child: Column(
            spacing: 5.h,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeAppText(
                data: "@sara",
                color: AppColors.redPinkMain,
                size: 12.sp,
              ),
              RecipeAppText(
                data: "Sara",
                color: Colors.white,
                size: 14.sp,
                weight: FontWeight.w300,
                font: false,
              ),
            ],
          ),
        ),
        Row(
          spacing: 10.w,
          children: [
            RecipeTextButtonContainer(
              text: "Following",
              textColor: AppColors.redPinkMain,
              containerColor: Colors.transparent,
              callback: () {},
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              containerHeight: 15.h,
              containerWidth: 70.w,
              containerPaddingH: 0.w,
            ),
            RecipeAppFollowButton(
              callback: () {},
              text: "Delete",
              fontSize: 15,
              weight: FontWeight.w500,
              width: 70,
              height: 21,
            ),
          ],
        ),
      ],
    );
  }
}
