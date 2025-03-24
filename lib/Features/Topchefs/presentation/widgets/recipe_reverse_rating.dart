import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';

import '../../../../Core/utils/colors.dart';

class RecipeReverseRating extends StatelessWidget {
  const RecipeReverseRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2.w,
      children: [
        RecipeAppText(data: "3587", color: AppColors.pinkSub, size: 12.sp),
        RecipeAppSvgPicture(
          svg: "assets/icons/star.svg",
          width: 12.w,
          color: AppColors.pinkSub,
        ),
      ],
    );
  }
}
