import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/resipe_detail_models.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipeDetail_view_Model.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

class RecipeDetailIngredientSection extends StatelessWidget {
  const RecipeDetailIngredientSection({
    super.key,
    required this.recipe,
  });

  final RecipeDetailModel recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3.h,
      children: List.generate(
        recipe.ingredients.length,
        (index) => Row(
          spacing: 3,
          children: [
            SizedBox(width: 3.w),
            Icon(Icons.circle, color: AppColors.redPinkMain, size: 6),
            if (recipe.ingredients[index].amount != null)
              RecipeAppText(
                data: recipe.ingredients[index].amount,
                color: AppColors.redPinkMain,
                size: 12.sp,line: 1,
              ),
            RecipeAppText(
              data: recipe.ingredients[index].name,
              color: Colors.white,
              size: 12.sp,line: 1,
            ),
          ],
        ),
      ),
    );
  }
}
