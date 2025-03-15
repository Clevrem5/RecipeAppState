import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';

import '../../../../Core/data/models/recipeModels/recipe_model.dart';

class RecipeImageWithLike extends StatelessWidget {
  const RecipeImageWithLike({
    super.key,
    required this.recipe,
  });

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169.w,
      height: 153.h,
      child: Stack(
        children: [
          Container(
            width: 169.w,
            height: 153.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.beigeColor,
                  offset: Offset(0, 1),
                  spreadRadius: 2,
                  blurRadius: 6,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageUrl: recipe.photo,
                width: 169.w,
                height: 153.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 7,
            right: 8,
            child: RecipeAppBarActionContainerButton(
              callback: () {},
              height: 15.h,
              width: 16.w,
              sizeHeight: 25,
              icon: 'assets/icons/heart.svg',
            ),
          ),
        ],
      ),
    );
  }
}
