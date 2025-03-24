import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';



class RecipeLogElevatedButton extends StatelessWidget {
  const RecipeLogElevatedButton({
    super.key,
    required this.text,
    required this.callback,
    this.size = const Size(207, 45),
    this.color = AppColors.pinkSub,
    this.textColor = AppColors.pinkColor,
  });

  final String text;
  final VoidCallback callback;
  final Size size;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: size,
        ),
        child: RecipeAppText(data: text, color: textColor, size: 20.sp,line: 1,),
      ),
    );
  }
}