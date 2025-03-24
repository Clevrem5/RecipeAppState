import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

class AuthPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthPageAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Size get preferredSize => Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: RecipeAppText(
          data: title,line: 1,
          color: AppColors.redPinkMain,
          size: 20.sp,
          weight: FontWeight.w600,
        ));
  }
}
