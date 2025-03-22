import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_bloc.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_state.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../../../Core/utils/sizes.dart';

class TrendingRecipeView extends StatelessWidget {
  const TrendingRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Trending Recipes",
      ),
      body: Column(
        children: [
          Container(
            width: 430 * AppSizes.Wratio,
            height: 241 * AppSizes.hRatio,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder<TrendingRecipeBloc, TrendingRecipesState>(
              builder: (context, state) {
                if (state.mainStatus == TrendingStatus.success && state.trendMain != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,
                    children: [
                      RecipeAppText(
                        data: "Most Viewed Today",
                        color: Colors.white,
                        size: 15.sp,
                      ),
                      Stack(
                        children: [
                          Image.network(
                            state.trendMain!.photo,
                            width: 358.w,
                            height: 143.h,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (state.status == TrendingStatus.load) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.status == TrendingStatus.error) {
                  return Center(child: Text("Xatolik yuz berdi"));
                }
                print(state.trendMain!.title);
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
