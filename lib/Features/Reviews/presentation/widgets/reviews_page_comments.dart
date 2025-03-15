import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/data/models/reviews/models/review_comment_model.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

class ReviewsPageComments extends StatelessWidget {
  const ReviewsPageComments({
    super.key, required this.comment,
  });

  final ReviewCommentsModel comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RecipeAppText(
            data: "Comments",
            color: AppColors.redPinkMain,
            size: 15.sp,
            weight: FontWeight.w500,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 7.w,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                    comment.user.profilePhoto,
                    // 'assets/images/andrew.png',
                      width: 46.w,
                      height: 42.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    spacing: 50,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RecipeAppText(
                        data: comment.user.username,
                        color: AppColors.redPinkMain,
                        size: 15.sp,
                      ),
                      RecipeAppText(
                        data: comment.created.toString(),
                        color: AppColors.redPinkMain,
                        size: 15.sp,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 19.h),
              Text(
                comment.comment,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.h),
              RecipeSvgButton(
                svg: 'assets/icons/stars.svg',
                width: 142.w,
                height: 15.26.h,
                sizeHeight: 16.h,
                sizeWidth: 93.w,
                color: AppColors.redPinkMain,
                callback: () {},
              ),
              SizedBox(height: 25.h),
              Divider(
                color: AppColors.pinkSub,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
