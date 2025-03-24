import 'package:flutter/material.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Placeholder(),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
