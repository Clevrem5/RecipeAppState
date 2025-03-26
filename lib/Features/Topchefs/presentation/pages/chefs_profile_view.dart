import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_state.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/pages/recipe_app_follow_button.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/pages/recipe_circle_image.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../../Core/utils/colors.dart';
import '../../../zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';
import '../../../zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

class TopChefsProfileDetail extends StatelessWidget {
  const TopChefsProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopChefsProfileBloc, TopChefsProfileState>(
        builder: (context, state) {
      final user = state.userInfo;
      return switch (state.profileStatus) {
        TopChefsProfileStatus.idle => Text('loaded'),
        TopChefsProfileStatus.loading => Center(
            child: CircularProgressIndicator(),
          ),
        TopChefsProfileStatus.success => Scaffold(
            extendBody: true,
            backgroundColor: AppColors.beigeColor,
            appBar: RecipeAppBar(
              title: "@${state.userInfo!.firstName}",
              actions: [
                RecipeAppBarActionContainerButton(
                  callback: () {},
                  icon: "assets/icons/share.svg",
                ),
                SizedBox(
                  width: 5,
                ),
                RecipeAppBarActionContainerButton(
                  callback: () {},
                  icon: "assets/icons/threedot.svg",
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 37, right: 37, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15.w,
                    children: [
                      RecipeCircleImage(
                        image: state.userInfo!.image,
                        width: 102.w,
                        height: 97.h,
                      ),
                      SizedBox(
                        width: 204.w,
                        height: 80.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RecipeAppText(
                              data: '${user!.firstName} ${user.lastName} Chef',
                              color: AppColors.redPinkMain,
                              size: 15.sp,
                              line: 1,
                              weight: FontWeight.w500,
                            ),
                            RecipeAppText(
                              data: user.bio,
                              color: Colors.white,
                              size: 12.sp,
                              line: 2,
                              weight: FontWeight.w300,
                            ),
                            RecipeAppFollowButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: RecipeBottomNavigation(),
          ),
        TopChefsProfileStatus.error => Text('Something went wrong...'),
      };
    });
  }
}
