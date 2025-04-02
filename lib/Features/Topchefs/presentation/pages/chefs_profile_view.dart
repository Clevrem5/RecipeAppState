import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Profile/presentation/widgets/recipe_userAppBar_info.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_state.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/widgets/profile_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import '../../../../Core/utils/colors.dart';
import '../../../CategoriesDetail/presentation/widgets/category_detail_info.dart';
import '../../../zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';
import '../widgets/recipe_app_follow_button.dart';
import '../widgets/recipe_circle_image.dart';

class TopChefsProfileDetail extends StatelessWidget {
  const TopChefsProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: ProfileAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 37, right: 37, top: 10),
        child: Column(
          children: [
            BlocBuilder<TopChefsProfileBloc, TopChefsProfileState>(builder: (context, state) {
              final user = state.userInfo;
              if (state.profileStatus == TopChefsProfileStatus.loading) {
                return Center(
                  child: Text('Waiting...'),
                );
              } else {
                return Column(
                  spacing: 13.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15.w,
                      children: [
                        RecipeCircleImage(
                          image: user!.image,
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
                                data: '${user.firstName} ${user.lastName} Chef',
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
                              RecipeAppFollowButton(
                                callback: (){},

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    AppbarInfo(user: user),
                    Column(
                      children: [
                        RecipeAppText(
                          data: "Recipes",
                          color: AppColors.pinkColor,
                          size: 12.sp,
                        ),
                        Divider(
                          color: AppColors.redPinkMain,
                        )
                      ],
                    ),

                  ],
                );
              }
            }),
            BlocBuilder<TopChefsProfileBloc, TopChefsProfileState>(
              builder: (context, state) => switch (state.recipeStatus) {

                TopChefsProfileStatus.idle => Text('Loaded...'),
                TopChefsProfileStatus.loading =>
                  Center(child: LinearProgressIndicator()),
                TopChefsProfileStatus.success => Expanded(
                  child: GridView.builder(
                    // key: ValueKey<List<RecipeModel>>(state.recipes!),
                    padding: EdgeInsets.only(bottom:  150.h,top: 20.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 226.h,
                      mainAxisSpacing: 30.h,
                      crossAxisSpacing: 18.w,
                    ),
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) => CategoryDetailInfo(recipe: state.recipes[index]),
                  ),
                ),
                TopChefsProfileStatus.error => Text('Something went wrong...'),
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
