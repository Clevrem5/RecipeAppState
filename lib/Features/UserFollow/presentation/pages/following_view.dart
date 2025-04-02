import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/UserFollow/presentation/widgets/follower_part.dart';
import 'package:recipeapp3/Features/UserFollow/presentation/widgets/following_part.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../../../zeroCommon/Appbar/recipe_app_bar.dart';

class FollowingView extends StatelessWidget {
  FollowingView({super.key});
  final contr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: "@dianne_r",
          isCenter: false,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              RecipeAppText(
                data: "120 Following",
                color: Colors.white,
                size: 15.sp,
              ),
              RecipeAppText(
                data: "250 Follower",
                color: Colors.white,
                size: 15.sp,
              ),
            ],
          ),
          actions: [],
        ),
        body: TabBarView(
          children: [
            FollowingPart(contr: contr),
            FollowerPart(contr: contr),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigation(),
      ),
    );
  }
}
