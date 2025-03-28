import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../../zeroCommon/Appbar/recipe_app_bar.dart';
import '../../zeroCommon/body/recipe_app_text.dart';

class RecipeElevatedButton extends StatelessWidget {
  const RecipeElevatedButton({
    super.key,
    required this.text, // Text maydoni required bo‘lishi kerak
    this.textColor = AppColors.pinkSub,
    this.backColor = AppColors.pinkColor,
    this.size = const Size(177, 27),
    required this.callback, // Default qiymat berildi
  });

  final Color textColor, backColor;
  final String text;
  final Size size; // Size noto‘g‘ri e’lon qilingan edi
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        minimumSize: size,
        alignment: Alignment.center,
        backgroundColor: backColor, // O‘zgartirilgan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: RecipeAppText(
        data: text, // Statik "Publish" o‘rniga dynamic text ishlatilmoqda
        color: textColor,
        size: 20.sp,
        weight: FontWeight.w500,
      ),
    );
  }
}
