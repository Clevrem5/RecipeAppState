import 'package:flutter/material.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';

import '../../../../Core/data/models/recipeModels/recipe_model.dart';

class RecipesItemImage extends StatelessWidget {
  const RecipesItemImage({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 170,
          height: 153,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.beigeColor,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              recipe.photo,
              fit: BoxFit.cover,
              width: 169,
              height: 153,
            ),
          ),
        ),
        Positioned(
          top: 7,
          right: 8,
          child: RecipeAppBarActionContainerButton(
            callback: () {},
            icon: "assets/icons/heart.svg",
          ),
        ),
      ],
    );
  }
}
