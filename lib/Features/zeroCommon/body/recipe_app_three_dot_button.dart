import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';

class RecipeAppThreeDotButton extends StatelessWidget {
  const RecipeAppThreeDotButton({
    super.key, required this.callback,
  });
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: RecipeAppSvgPicture(
        svg: "assets/icons/threedot.svg",
        width: 4.w,
        height: 15.h,
        color: AppColors.redPinkMain,
      ),
    );
  }
}
