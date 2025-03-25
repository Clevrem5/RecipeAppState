import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_image_with_like.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';

import '../../../Core/utils/colors.dart';

class RecipeAppButtonContainer extends StatelessWidget {
  const RecipeAppButtonContainer({
    super.key,
    this.onPress=true,
  });

  final bool onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: onPress ? AppColors.redPinkMain : AppColors.pinkColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: RecipeAppSvgPicture(
            svg: 'assets/icons/heart.svg',
            width: 16.w,
            height: 15.h,
            color: onPress ? Colors.white : AppColors.pinkSub,
          ),
        ),
      ),
    );
  }
}
