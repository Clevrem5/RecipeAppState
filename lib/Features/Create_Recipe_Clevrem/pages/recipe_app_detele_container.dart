import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_three_dot_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_e_leveted_button.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/widgets/recipe_detail_video_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipeAuthText_field.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../../zeroCommon/Appbar/recipe_app_bar.dart';
import '../../zeroCommon/body/recipe_text_field_simple.dart';

class RecipeAppDeteleContainer extends StatelessWidget {
  const RecipeAppDeteleContainer({
    super.key, required this.callBack,
  });
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:callBack,
      child: Container(
        width: 41.w,
        height: 41.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.pinkColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: RecipeAppSvgPicture(
          svg: "assets/icons/delete.svg",
          width: 16.w,
          height: 22.h,
          color: AppColors.redPinkMain,
        ),
      ),
    );
  }
}
