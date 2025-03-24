import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/resipe_detail_models.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/widgets/recipe_detail_image_and_video.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';

import '../../../../Core/navigation/paths.dart';

class RecipeDetailVideoPlayer extends StatelessWidget {
  const RecipeDetailVideoPlayer({
    super.key,
    required this.recipe,
  });

  final RecipeDetailModel recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 356.w,
        height: 337.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 356.w,
              height: 65.h,
              padding: EdgeInsets.fromLTRB(
                10.w,
                10.h,
                10.w,
                16.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
                color: AppColors.redPinkMain,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeAppText(line: 1,
                    data: recipe.title,
                    color: Colors.white,
                    size: 20.sp,
                    weight: FontWeight.w500,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          RecipeAppSvgPicture(svg: "assets/icons/star.svg"),
                          RecipeAppText(line: 1,
                            data: recipe.rating.toString(),
                            color: Colors.white,
                            size: 12.sp,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => context.push(
                          Routes.getReviews(recipe.id),
                        ),
                        child: Row(
                          spacing: 5,
                          children: [
                            RecipeAppSvgPicture(svg: "assets/icons/reviews.svg"),
                            RecipeAppText(
                              data: '78579',
                              color: Colors.white,
                              size: 12.sp,line: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: RecipeDetailImageAndVideo(recipe: recipe),
            ),
          ],
        ),
      ),
    );
  }
}
