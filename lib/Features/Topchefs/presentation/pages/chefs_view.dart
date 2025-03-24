import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/widgets/newChefs.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/widgets/top_chefs_viewed.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../../../../Core/utils/colors.dart';
import '../manager/top_chefs_bloc.dart';
import '../manager/top_chefs_state.dart';
import '../widgets/top_chefs_liked.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Top Chef",
        actions: [
          RecipeAppBarActionContainerButton(
            callback: () {},
            icon: "assets/icons/notification.svg",
          ),
          SizedBox(
            width: 5,
          ),
          RecipeAppBarActionContainerButton(
            callback: () {},
            icon: "assets/icons/search.svg",
          ),
        ],
      ),
      body: BlocBuilder<TopChefsBloc, TopChefsState>(
        builder: (context, state) {
          if (state.mostLikedChefsStatus == TopChefsStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Container(
                height: 285.h,
                padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
                decoration: BoxDecoration(
                  color: AppColors.redPinkMain,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  spacing: 10.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecipeAppText(
                      data: "Most Viewed chefs",
                      color: Colors.white,
                      size: 15.sp,
                      weight: FontWeight.w500,
                    ),
                    TopChefsViewed(state: state)
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 150.h, right: 36.w, left: 36.w),
                  children: [
                    Column(
                      spacing: 12.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RecipeAppText(
                          data: "Most Liked chefs",
                          color: AppColors.redPinkMain,
                          size: 15.sp,
                          weight: FontWeight.w500,
                        ),
                        TopChefsLiked(
                          state: state,
                        ),
                        RecipeAppText(
                          data: "New Chefs",
                          color: AppColors.redPinkMain,
                          size: 15.sp,
                          weight: FontWeight.w500,
                        ),
                        NewChefs(state: state),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
