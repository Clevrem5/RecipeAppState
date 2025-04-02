import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/widgets/recipe_app_follow_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_three_dot_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_textButton.dart';

import '../../../../Core/utils/colors.dart';

class FollowingPartUsers extends StatelessWidget {
  const FollowingPartUsers({
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
                data: "@neil",
                color: AppColors.redPinkMain,
                size: 12.sp,
              ),
              RecipeAppText(
                data: "Emily",
                color: Colors.white,
                size: 14.sp,
                weight: FontWeight.w300,
                font: false,
              ),
            ],
          ),
        ),
        Row(
          spacing: 8.w,
          children: [
            RecipeAppFollowButton(
              callback: () {},
              text: "Following",
              fontSize: 15,
              weight: FontWeight.w500,
              width: 109.09,
              height: 21,
            ),
            RecipeAppThreeDotButton(
              callback: () {
                showModalBottomSheet(
                  elevation: 4,
                  context: context,
                  backgroundColor: Colors.white,
                  // Orqa fon rangi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 45.h, horizontal: 56.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 17.h,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            spacing:10.w,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  'assets/images/lunch.png',
                                  width: 64.w,
                                  height: 63.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: RecipeAppText(
                                  data: "@neil ",
                                  color: AppColors.redPinkMain,
                                  size: 15.sp,
                                  weight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          RecipeTextButtonContainer(
                            text: "Manage notifications",
                            textColor: AppColors.beigeColor,
                            containerColor: Colors.transparent,
                            containerPaddingH: 2,
                            containerWidth: double.infinity,
                            fontWeight: FontWeight.w400,
                            containerHeight: 23.h,
                            callback: () {},
                          ),
                          RecipeTextButtonContainer(
                            text: "Mute notifications",
                            textColor: AppColors.beigeColor,
                            containerColor: Colors.transparent,
                            containerPaddingH: 2,
                            containerWidth: double.infinity,
                            fontWeight: FontWeight.w400,
                            containerHeight: 23.h,
                            callback: () {},
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
