import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';

import '../../../zeroCommon/body/recipe_app_text.dart';

class RecipePageTitles extends StatelessWidget {
  const RecipePageTitles({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return RecipeAppText(
      data: text,
      color: AppColors.redPinkMain,
      size: 20.sp,
      weight: FontWeight.w600,
    );
  }
}
