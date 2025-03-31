import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/Create_Recipe_Clevrem/pages/recipe_app_detele_container.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/widgets/recipe_detail_video_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipeAuthText_field.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_three_dot_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_e_leveted_button.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../zeroCommon/Appbar/recipe_app_bar.dart';
import '../../zeroCommon/body/recipe_text_field_simple.dart';

class CreateRecipeView extends StatelessWidget {
  CreateRecipeView({super.key});

  final contr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Create Recipe",
        actions: [],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 500.h, left: 36.w, right: 36.w),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecipeElevatedButton(
                text: "Publish",
                callback: () {},
                widthSize: 177,
                heightSize: 27,
              ),
              RecipeElevatedButton(
                text: "Delete",
                callback: () {},
                widthSize: 177,
                heightSize: 27,
              ),
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
                GestureDetector(
                  onTap: () {},
                  child: RecipeDetailVideoButton(
                    alpha: 0.45,
                  ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15.h,
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
                RecipeAppText(
                  data: "Ingredients",
                  color: Colors.white,
                  size: 15.sp,
                  weight: FontWeight.w500,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 5.w,
                      children: [
                        RecipeAppThreeDotButton(callback: () {}),
                        RecipeTextFieldSimple(
                          validator: (value) => null,
                          controller: contr,
                          width: 70.w,
                          height: 41.h,
                          hint: "Amt",
                        ),
                        RecipeTextFieldSimple(
                          validator: (value) => null,
                          controller: contr,
                          width: 224.25.w,
                          height: 41.h,
                          hint: "Ingredients",
                          isCenter: false,
                        ),
                        RecipeAppDeteleContainer(
                          callBack: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: RecipeElevatedButton(
                        text: "+ Add Ingredients",
                        callback: () {},
                        backColor: AppColors.redPinkMain,
                        widthSize: 211,
                        heightSize: 35,
                        textColor: AppColors.beigeColor,
                      ),
                    )
                  ],
                ),
                RecipeAppText(
                  data: "Instructions",
                  color: AppColors.pinkColor,
                  size: 15.sp,
                  weight: FontWeight.w500,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecipeAppThreeDotButton(
                          callback: () {},
                        ),
                        RecipeTextFieldSimple(
                          validator: (value) => null,
                          controller: contr,
                          width: 301.25.w,
                          height: 52.h,
                          isCenter: false,
                          hint: "Instructions 1",
                        ),
                        RecipeAppDeteleContainer(
                          callBack: () {},
                        ),
                      ],
                    ),
                    SizedBox(height:30.h),
                    Center(
                      child: RecipeElevatedButton(
                        text: "+ Add Instructions",
                        callback: () {},
                        backColor: AppColors.redPinkMain,
                        widthSize: 211,
                        heightSize: 35,
                        textColor: AppColors.beigeColor,
                      ),
                    )
                  ],
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
