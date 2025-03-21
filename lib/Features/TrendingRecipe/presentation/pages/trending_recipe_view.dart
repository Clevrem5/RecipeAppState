import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            decoration: BoxDecoration(
              color: AppColors.redPinkMain,
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder<TrendingRecipeBloc, TrendingRecipesState>(
              builder: (context, state) {
                if (state.status == TrendingStatus.idle && state.trendMain != null) {
                  return Column(
                    children: [
                      Image.network(state.trendMain!.photo,width: 100,height: 100,),
                      RecipeAppText(data: state.trendMain!.title, color: Colors.white, size: 20,),
                    ],
                  );
                } else if (state.status == TrendingStatus.load) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.status == TrendingStatus.error) {
                  return Center(child: Text("Xatolik yuz berdi"));
                }
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
