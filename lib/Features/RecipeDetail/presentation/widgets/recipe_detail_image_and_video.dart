import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/resipe_detail_models.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/widgets/recipe_detail_video_button.dart';

class RecipeDetailImageAndVideo extends StatelessWidget {
  const RecipeDetailImageAndVideo({
    super.key,
    required this.recipe,
  });

  final RecipeDetailModel recipe;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: recipe.photo,
            width: 356.w,
            height: 281.h,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 141.w,
            top: 105.h,
            child: RecipeDetailVideoButton(),
          ),
        ],
      ),
    );
  }
}
