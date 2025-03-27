import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

class AppbarInform extends StatelessWidget {
  const AppbarInform({
    super.key,
    required this.number,
    required this.label,
  });

  final int number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 1,
      children: [
        RecipeAppText(
          data: number.toString(),
          size: 15.sp,
          color: AppColors.pinkColor,

        ),
        RecipeAppText(
          data: label,
          size: 12.sp,
          color: AppColors.pinkColor,
        ),
      ],
    );
  }
}