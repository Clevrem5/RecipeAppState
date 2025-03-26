import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/data/models/topchefs_model.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_image_with_like.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../../../../Core/utils/colors.dart';
import '../manager/topcefs/top_chefs_bloc.dart';
import '../manager/topcefs/top_chefs_state.dart';

class FollowingButton extends StatelessWidget {
  const FollowingButton({
    super.key,
    this.size = 8,
    this.backColor = AppColors.redPinkMain,
    this.textColor = Colors.white,
    this.text = "Following",
  });

  final double size;
  final String text;
  final Color backColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: RecipeAppText(
        data: text,
        color: textColor,
        size: size.sp,
      ),
    );
  }
}
