import 'package:flutter/material.dart';
import 'package:recipeapp3/Features/UserFollow/presentation/widgets/follow_view_app_bar.dart';
import 'package:recipeapp3/Features/UserFollow/presentation/widgets/follower_part.dart';
import 'package:recipeapp3/Features/UserFollow/presentation/widgets/following_part.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

class FollowingView extends StatelessWidget {
  FollowingView({super.key});
  final contr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        appBar: FollowViewAppBar(),
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
