import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

import '../../data/models/recipe_model.dart';

class RecipeRating extends StatelessWidget {
  const RecipeRating({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RecipeAppText(
          data: recipe.rating.toString(),
          color: AppColors.pinkSub,
          size: 12.sp,
        ),
        RecipeSvgButton(
          svg: 'assets/icons/star.svg',
          width: 10.w,
          height: 10.h,
          sizeHeight: 10.h,
          sizeWidth: 10.w,
          color: AppColors.pinkSub,
          callback: () {},
        ),
      ],
    );
  }
}
