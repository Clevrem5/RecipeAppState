import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

class RecipeAppBarVector extends StatelessWidget {
  const RecipeAppBarVector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RecipeSvgButton(
        svg: "assets/icons/vector.svg",
        width: 40,
        height: 16,
        color: AppColors.redPinkMain,
        callback: () {
          context.pop();
        },
      ),
    );
  }
}
