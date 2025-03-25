
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/colors.dart';
import '../../../zeroCommon/Appbar/recipe_app_bar.dart';
import '../../../zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';
import '../../../zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../manager/topcefs/top_chefs_state.dart';
import '../manager/topcefs_profile/top_chefs_profile_bloc.dart';
import '../manager/topcefs_profile/top_chefs_profile_state.dart';
import '../widgets/chefs_recipe_section.dart';

class TopChefsProfileDetail extends StatelessWidget {
  const TopChefsProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: RecipeAppBar(
        title: "@neil_tran",
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
      body: BlocBuilder<TopChefsProfileBloc, TopChefsProfileState>(
        builder: (context, state) {
          return switch (state.recipeStatus) { TopChefsProfileStatus.idle => Padding(
            padding: const EdgeInsets.only(top: 10, left: 37, right: 37),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // // for (var chef in state.userInfo!.hashCode)
                        // Image.network(
                        //   state.userInfo!.image,
                        //   width: 102.w,
                        //   height: 102.h,
                        //   fit: BoxFit.cover,
                        // ),
                        SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Neil Tran-Chef",
                              style: TextStyle(
                                color: AppColors.beigeColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Passionate chef in creative and\n"
                              "contemporary cuisine.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              width: 81.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                color: AppColors.pinkSub,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  "Following",
                                  style: TextStyle(
                                    color: AppColors.redPinkMain,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: 356.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.beigeColor,
                        borderRadius: BorderRadius.circular(14),
                        border:
                            Border.all(color: AppColors.pinkSub, width: 1.2.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "15",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "recipes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 30.h,
                            width: 1.w,
                            color: AppColors.pinkSub,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "Following",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 30.h,
                            width: 1.w,
                            color: AppColors.pinkSub,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "255.770",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "Followers",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.71.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Recipes",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Divider(
                      color: AppColors.redPinkMain,
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ChefsProfileRecipes(
                      text: "Vegan Recipes",
                      // recipe: state.recipeStatus,
                    ),
                    // SizedBox(
                    //   height: 12.h,
                    // ),
                    // ChefsProfileRecipes(
                    //   text: "Asian Heritage",
                    // ),
                    // SizedBox(
                    //   height: 12.h,
                    // ),
                    // ChefsProfileRecipes(
                    //   text: "Guilty Pleasures",
                    // ),
                  ],
                ),
              ],
            ),
          ),
          TopChefsProfileStatus.loading => Center(
            child: CircularProgressIndicator(),
          ),
          TopChefsProfileStatus.success => Text("sdecerc"),
          TopChefsProfileStatus.error => Center(
            child: Text("errrrrorrrr"),
          )
          };
        },
      ),
      // body:
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
