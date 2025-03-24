import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/data/models/recipeModels/recipe_model.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_image_with_like.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_rating.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_time.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_bloc.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_state.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/widgets/recipe_trend_main.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_detail_view_svg_picture.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../../../Core/navigation/paths.dart';
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
          RecipeTrendMain(),
          BlocBuilder<TrendingRecipeBloc, TrendingRecipesState>(
            builder: (context, state) {
              final recipes = state.trendRecipes;
              switch (state.recipeStatus) {
                case null:
                  return Text("xato bor null");

                case TrendingStatus.idle:
                  return Text("xato bor idleda");

                case TrendingStatus.load:
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                case TrendingStatus.error:
                  return Text("xato bor errorda");

                case TrendingStatus.success:
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(36.w, 20.h, 36.w, 150.h),
                      itemCount: recipes!.length,
                      separatorBuilder: (context, index) => SizedBox(height: 15.h),
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return SizedBox(
                          width: 358.w,
                          height: 150.h,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RecipeImageWithLike<List<RecipeModel>>(
                                  recipe: recipes,
                                  getPhotoUrl: (recipe) => recipe[index].photo,
                                  width: 151.w,
                                  height: 150.h,
                                  shadow: false,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => context.push(
                                  Routes.getRecipeDetail(recipe.id),
                                ),
                                child: Container(
                                  width: 207.w,
                                  height: 122.h,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(14),
                                    ),
                                    border: Border.all(color: AppColors.pinkSub, width: 1),
                                  ),
                                  child: Column(
                                    spacing: 6.h,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RecipeAppText(
                                        data: recipe.title,
                                        color: Colors.black,
                                        size: 12.sp,
                                        line: 1,
                                        height: 1,
                                      ),
                                      RecipeAppText(
                                        data: recipe.description,
                                        color: Colors.black,
                                        size: 13.sp,
                                        line: 2,
                                        // height: 1,
                                        font: false,
                                        weight: FontWeight.w300,
                                      ),
                                      RecipeAppText(
                                        data: "By chef ${recipe.categoryId}",
                                        color: AppColors.redPinkMain,
                                        size: 12.sp,
                                        line: 1,
                                        height: 1,
                                        font: true,
                                        weight: FontWeight.w300,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          RecipeRating(recipe: recipe),
                                          Row(
                                            children: [
                                              RecipeAppText(
                                                data: "Easy",
                                                color: AppColors.pinkSub,
                                                size: 12.sp,
                                                weight: FontWeight.w300,
                                              ),
                                              RecipeAppSvgPicture(
                                                svg: 'assets/icons/level.svg',
                                                width: 13.w,
                                                height: 10.h,
                                                color: AppColors.pinkSub,
                                              ),
                                            ],
                                          ),
                                          RecipeTime(recipe: recipe),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
              }
            },
          )
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
