import 'package:flutter/material.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Core/data/models/categories_model.dart';

class CategoriesDetailAppbarBottomItems extends StatelessWidget {
  const CategoriesDetailAppbarBottomItems({
    super.key,
    required this.title,
    required this.callback,
    required this.isSelected,
  });

  final String title;
  final VoidCallback callback;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected? AppColors.redPinkMain:Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: RecipeAppText(
          color: isSelected? Colors.white:AppColors.redPinkMain,
          data: title,
          size: 16,
          font: false,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
