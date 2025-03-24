import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/resipe_detail_models.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipeDetail_view_Model.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

class RecipeUserFollowing extends StatelessWidget {
  const RecipeUserFollowing({
    super.key,
    required this.recipe,
  });

  final RecipeDetailModel recipe;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                recipe.user.profilePhoto,
              ),
              radius: 23,
            ),
            SizedBox(
              width: 155.3.w,
              height: 38.1.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  RecipeAppText(
                    data: '@${recipe.user.username}',
                    color: AppColors.redPinkMain,
                    height: 1,
                    size: 12.sp,line: 1,
                  ),
                  RecipeAppText(
                    data:
                        "${recipe.user.firstName} ${recipe.user.lastName}",
                    color: Colors.white,
                    size: 13.sp,
                    line: 1,
                    weight: FontWeight.w300,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          spacing: 5,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(109.w, 21.h),
                backgroundColor: AppColors.pinkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: RecipeAppText(
                data: 'Following',
                color: AppColors.pinkSub,
                size: 14.sp,line: 1,
                weight: FontWeight.w500,
              ),
            ),
            RecipeAppSvgPicture(
              svg: "assets/icons/threedot.svg",
              color: AppColors.redPinkMain,
              height: 15.h,
            ),
          ],
        ),
      ],
    );
  }
}
