import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

class RecipeAppBarActionContainerButton extends StatelessWidget {
  const RecipeAppBarActionContainerButton({
    super.key,
    required this.callback,
    required this.icon,
    this.width = 12,
    this.height = 17,
    this.sizeHeight = 25,
  });

  final VoidCallback callback;
  final String icon;
  final double width, height,sizeHeight;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(430, 932));
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.pinkColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: RecipeSvgButton(
          svg: icon,
          width: width,
          height: height,
          sizeHeight: sizeHeight,
          color: AppColors.pinkSub,
          callback: callback,
        ),
      ),
    );
  }
}
