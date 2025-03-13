import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

import '../../data/models/recipe_model.dart';

class RecipesItemsInfo extends StatelessWidget {
  const RecipesItemsInfo({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 158,
        height: 75,
        padding: EdgeInsets.fromLTRB(
          11.w,
          5.h,
          11.w,
          100.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(14),
          ),
        ),
        child: Column(
          spacing: 3,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeAppText(
              data: recipe.title,
              color: AppColors.beigeColor,
              size: 12,
              height: 1,
            ),
            RecipeAppText(
              data: recipe.description,
              color: AppColors.beigeColor,
              size: 11,
              font: false,
              weight: FontWeight.w200,
              line: 2,
              height: 1,
            ),
            SizedBox(height: 5,
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(spacing: 3,
                    children: [
                      RecipeAppText(
                        data: recipe.rating.toString(),
                        color: AppColors.redPinkMain,
                        size: 12,
                      ),
                      RecipeSvgButton(
                        svg: 'assets/icons/star.svg',
                        width: 10,
                        height: 10,
                        callback: () {},
                      ),
                    ],
                  ),
                  Row(spacing: 3,
                    children: [
                      RecipeSvgButton(
                        svg: 'assets/icons/clock.svg',
                        width: 10,
                        height: 10,
                        callback: () {},
                      ),
                      RecipeAppText(
                        data: '${recipe.timeRequired} min',
                        color: AppColors.redPinkMain,
                        size: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
