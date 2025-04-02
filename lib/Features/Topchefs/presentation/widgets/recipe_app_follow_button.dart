import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../../Core/utils/colors.dart';

class RecipeAppFollowButton extends StatelessWidget {
  const RecipeAppFollowButton({
    super.key,
    this.width = 81,
    this.height = 20,
    this.backColor = AppColors.pinkColor,
    this.textColor = AppColors.pinkSub,
    this.fontSize = 11,
    this.text = "Following",
    this.weight = FontWeight.w400,
    required this.callback,
  });

  final double width, height, fontSize;
  final String text;
  final Color backColor, textColor;
  final FontWeight weight;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: width.w,
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(
            width / 2,
          ),
        ),
        child: RecipeAppText(
          data: text,
          color: textColor,
          size: fontSize.sp,
          weight: weight,
        ),
      ),
    );
  }
}
