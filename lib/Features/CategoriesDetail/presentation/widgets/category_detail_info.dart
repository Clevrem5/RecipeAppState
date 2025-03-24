import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_image_with_like.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../../Core/data/models/recipeModels/recipe_model.dart';
import '../../../../Core/navigation/paths.dart';
import 'recipe_rating.dart';
import 'recipe_time.dart';

class CategoryDetailInfo extends StatelessWidget {
  const CategoryDetailInfo({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.getRecipeDetail(recipe.id));
      },

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 158.50.w,
            height: 76.h,
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 3.h,
              bottom: 4.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(14),
              ),
              border: Border.all(color: AppColors.pinkSub, width: 1.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeAppText(
                  data: recipe.title,
                  color: AppColors.beigeColor,
                  size: 12.sp,
                  line: 1,
                ),
                RecipeAppText(
                  data: recipe.description,
                  color: AppColors.beigeColor,
                  size: 13.sp,
                  font: false,
                  line: 2,
                  height: 1,
                  weight: FontWeight.w300,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecipeRating(recipe: recipe),
                    RecipeTime(recipe: recipe),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: RecipeImageWithLike<RecipeModel>(
              recipe: recipe, getPhotoUrl: (RecipeModel recipeModel ) {
                return recipeModel.photo;
              },
            ),
          ),
        ],
      ),
    );
  }
}
