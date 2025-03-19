import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipeapp3/Core/utils/colors.dart';

class RecipeDetailVideoButton extends StatelessWidget {
  const RecipeDetailVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 74.01.w,
        height: 71.46.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          color: AppColors.redPinkMain,
        ),
        child: SvgPicture.asset(
          "assets/icons/video.svg",
          width: 30.w,
          height: 40.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
