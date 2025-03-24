import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

import '../../../../Core/data/models/recipeModels/recipe_model.dart';

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        RecipeSvgButton(
          svg: 'assets/icons/clock.svg',
          width: 10.w,
          height: 10.h,
          sizeHeight: 10.h,
          sizeWidth: 10.w,
          color: AppColors.pinkSub,
          callback: () {},
        ),
        RecipeAppText(
          data: '${recipe.timeRequired} min',
          color: AppColors.pinkSub,
          size: 12.sp,
          line: 1,
          height: 1,
        ),
      ],
    );
  }
}
