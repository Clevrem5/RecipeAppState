import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_state.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';

import '../../../../Core/utils/colors.dart';
import '../../../zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';
import '../../../zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

class RecipeCircleImage extends StatelessWidget {
  const RecipeCircleImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.radius=50,
  });

  final String image;
  final double width, height, radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        image,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
