import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/navigation/paths.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_svg_button.dart';

class RecipeBottomNavigation extends StatelessWidget {
  const RecipeBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(430, 932));
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 126.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.beigeColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35, left: 40),
            child: Container(
              width: 280,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.redPinkMain,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecipeSvgButton(
                    svg: "assets/icons/home.svg",
                    width: 25.15,
                    height: 22,
                    callback: () {
                      context.push(Paths.reView);
                    },
                  ),
                  RecipeSvgButton(
                    svg: "assets/icons/community.svg",
                    width: 24,
                    height: 22,
                    callback: () {
                      context.go(Paths.homePage);
                    },
                  ),
                  RecipeSvgButton(
                    svg: "assets/icons/categories.svg",
                    width: 25.15,
                    height: 23,
                    callback: () {
                      context.go(Paths.categories);
                    },
                  ),
                  RecipeSvgButton(
                    svg: "assets/icons/profile.svg",
                    width: 14.79,
                    height: 22,
                    callback: () {
                      // context.go(Paths.profile);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
