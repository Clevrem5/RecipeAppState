import 'package:flutter/material.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipes_item_image.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

import '../../../../Core/data/models/recipeModels/recipe_model.dart';

class RecipesItem extends StatelessWidget {
  const RecipesItem({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 159,
            height: 76,
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.beigeColor,
                    fontSize: 12,
                  ),
                ),
                Text(
                  recipe.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.beigeColor,
                    fontSize: 9,
                    height: 1,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Row(
                  spacing: -10,
                  children: [
                    Row(
                      spacing: 2,
                      children: [
                        Text(
                          recipe.rating.toString(),
                          style: TextStyle(
                            color: AppColors.redPinkMain,
                            fontSize: 10,
                          ),
                        ),
                        RecipeSvgButton(
                          svg: 'assets/icons/star.svg',
                          width: 10,
                          height: 10,
                          callback: () {},
                          color: AppColors.redPinkMain,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 2,
                      children: [
                        RecipeSvgButton(
                          svg: 'assets/icons/clock.svg',
                          width: 10,
                          height: 10,
                          callback: () {},
                          color: AppColors.redPinkMain,
                        ),
                        Text(
                          '${recipe.timeRequired}min',
                          style: TextStyle(
                            color: AppColors.redPinkMain,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: RecipesItemImage(recipe: recipe),
          ),
        ],
      ),
    );
  }
}
