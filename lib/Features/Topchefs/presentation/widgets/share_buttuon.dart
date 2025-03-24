import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';

import '../../../../Core/utils/colors.dart';

class shareButtuon extends StatelessWidget {
  const shareButtuon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20),
      ),
      child: RecipeAppSvgPicture(
        svg: "assets/icons/share.svg",
        color: Colors.white,
      ),
    );
  }
}
