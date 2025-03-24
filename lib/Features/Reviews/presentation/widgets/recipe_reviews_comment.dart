import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipeapp3/Core/data/models/reviews/models/review_comment_model.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/datetimetoString.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

class RecipeReviewsComment extends StatelessWidget {
  const RecipeReviewsComment({
    super.key,
    required this.comment,
  });

  final ReviewCommentsModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 7.w,
          children: [
            Row(
              spacing: 5,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    comment.user.profilePhoto,
                  ),
                  radius: 17.5,
                ),
                RecipeAppText(
                  data: comment.user.username,
                  color: AppColors.redPinkMain,
                  size: 15.sp,line: 1,
                ),
              ],
            ),
            FutureBuilder<String>(
              future: createdDateCounter(comment.created.toString()), // Future funksiyani chaqiramiz
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Yuklanish holati
                } else if (snapshot.hasError) {
                  return Text('Xatolik: ${snapshot.error}');
                } else {
                  return RecipeAppText(
                    data: snapshot.data ?? 'Noma’lum sana',
                    color: AppColors.redPinkMain,
                    size: 12.sp,line: 1,
                  );
                }
              },
            )
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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            num rating = comment.rating;
            return Row(
              children: [
                SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: SvgPicture.asset(
                    'assets/icons/star-${index < rating ? 'full' : 'empty'}.svg', // Orticha bo'sh joy olib tashlandi
                    colorFilter: ColorFilter.mode(
                      AppColors.redPinkMain,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                if (index < 4) SizedBox(width: 10.w), // Ikkita star orasidagi bo'sh joy
              ],
            );
          }),
        ),
        SizedBox(height: 25.h),
        Divider(
          color: AppColors.pinkSub,
        ),
      ],
    );
  }
}
