import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../../Core/utils/colors.dart';

class RecipeAppFollowButton extends StatelessWidget {
  const RecipeAppFollowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 81.w,
      height: 20.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.pinkColor,
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      child: RecipeAppText(
        data: "Following",
        color: AppColors.pinkSub,
        size: 11.sp,
      ),
    );
  }
}
