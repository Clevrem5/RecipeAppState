import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/resipe_detail_models.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../zeroCommon/bottomNavigation/recipe_svg_button.dart';

class RecipeDetailPart extends StatelessWidget {
  const RecipeDetailPart({
    super.key,
    required this.recipe,
  });

  final RecipeDetailModel recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 9.h,
      children: [
        Row(
          spacing: 10,
          children: [
            RecipeAppText(
              data: "Details",
              color: AppColors.redPinkMain,
              size: 20.sp,line: 1,
              weight: FontWeight.w600,
            ),
            Row(
              spacing: 5.w,
              children: [
                RecipeSvgButton(
                  svg: 'assets/icons/clock.svg',
                  width: 10.w,
                  height: 10.h,
                  sizeHeight: 10.h,
                  sizeWidth: 10.w,
                  color: Colors.white,
                  callback: () {},
                ),
                RecipeAppText(
                  data: '${recipe.timeRequired} min',
                  color: Colors.white,
                  size: 12.sp,line: 1,
                ),
              ],
            ),
          ],
        ),
        RecipeAppText(
          data: recipe.description,
          color: Colors.white,
          size: 12.sp,
          line: 3,
        ),
      ],
    );
  }
}
