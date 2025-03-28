import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/Create_Recipe_Clevrem/pages/recipe_e_leveted_button.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/widgets/recipe_detail_video_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipeAuthText_field.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../zeroCommon/Appbar/recipe_app_bar.dart';

class CreateRecipeView extends StatelessWidget {
   CreateRecipeView({super.key});

  final contr=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Create Recipe",
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(19.2.w, 10.h, 19.w, 500.h),
        children: [
          Row(
            spacing: 3.6,
            children: [
              RecipeElevatedButton(text: "Publish", callback: () {}),
              RecipeElevatedButton(text: "Delete", callback: () {}),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            width: 362.w,
            height: 281.h,
            padding: EdgeInsets.only(top: 90.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.pinkColor.withValues(alpha: 0.66),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              spacing: 15.h,
              children: [
                RecipeDetailVideoButton(
                  alpha: 0.45,
                ),
                RecipeAppText(
                  data: "Add video recipe",
                  color: AppColors.pinkColor,
                  size: 13.sp,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Form(
            key: GlobalKey<FormState>(),
            child: Column(spacing: 15.h,
              children: [
                RecipeAuthTextField(
                  label: "Title",
                  hint: "Recipe title",
                  validator: (value) => null,
                  controller: contr,
                ),
                RecipeAuthTextField(
                  label: "Description",
                  hint: "Recipe Description",
                  validator: (value) => null,
                  controller: contr,
                ),
                RecipeAuthTextField(
                  label: "Time Recipe",
                  hint: "1hour,30min...",
                  validator: (value) => null,
                  controller: contr,
                ),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
