import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../Appbar/recipe_app_bar.dart';
import 'recipe_app_text.dart';

class RecipeElevatedButton extends StatelessWidget {
  const RecipeElevatedButton({
    super.key,
    required this.text, // Text maydoni required bo‘lishi kerak
    this.textColor = AppColors.pinkSub,
    this.backColor = AppColors.pinkColor,
    this.widthSize=0,
    this.heightSize=0,
    required this.callback, // Default qiymat berildi
  });

  final Color textColor, backColor;
  final String text;
  final double widthSize,heightSize; // Size noto‘g‘ri e’lon qilingan edi
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widthSize.w, heightSize.h),
        alignment: Alignment.center,
        backgroundColor: backColor, // O‘zgartirilgan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: RecipeAppText(
        data: text, // Statik "Publish" o‘rniga dynamic text ishlatilmoqda
        color: textColor,
        size: 15.sp,
        weight: FontWeight.w500,
      ),
    );
  }
}
