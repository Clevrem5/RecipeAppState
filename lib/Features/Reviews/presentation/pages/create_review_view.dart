import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/create_review_add_photo.dart';
import 'package:recipeapp3/Features/Reviews/presentation/widgets/review_rating_star.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../widgets/create_review_text.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Leave A Review",
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(36.w, 0, 36.w, 100.h),
        children: [
          ReviewRatingStar(),
          SizedBox(height: 30.h),
          CreateReviewText(),
          SizedBox(height: 30.h),
          CreateReviewAddPhoto(),
          SizedBox(height: 30.h),

        ],
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
