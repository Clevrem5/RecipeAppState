import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_image_with_like.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_rating.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_time.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_bloc.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_state.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../../Core/data/models/recipeModels/recipe_model.dart';
import '../../../../Core/navigation/paths.dart';
import '../../../../Core/utils/sizes.dart';

class RecipeTrendMain extends StatelessWidget {
  const RecipeTrendMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430 * AppSizes.Wratio,
      height: 241 * AppSizes.hRatio,
      padding: EdgeInsets.fromLTRB(36.w, 9.h, 36.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<TrendingRecipeBloc, TrendingRecipesState>(
        builder: (context, state) {
          final recipe = state.trendMain;
          if (state.mainStatus == TrendingStatus.success && state.trendMain != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                RecipeAppText(
                  data: "Most Viewed Today",
                  color: Colors.white,
                  line: 1,
                  size: 15.sp,
                ),
                SizedBox(
                  width: 358.w,
                  height: 182.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GestureDetector(
                        onTap: () => context.push(
                          Routes.getRecipeDetail(recipe.id),
                        ),
                        child: Container(
                          width: 348.w,
                          height: 49.h,
                          clipBehavior: Clip.hardEdge,
                          padding: EdgeInsets.fromLTRB(15.w, 12.h, 15.w, 2.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            spacing: 2,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RecipeAppText(
                                    data: recipe!.title,
                                    color: Colors.black,
                                    size: 13.sp,
                                    line: 1,
                                    height: 1,
                                  ),
                                  RecipeTime(recipe: recipe),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: SizedBox(
                                      width: 250.w,
                                      child: RecipeAppText(
                                        data: recipe.description,
                                        color: Colors.black,
                                        size: 13.sp,
                                        line: 1,
                                        font: false,
                                        height: 1,
                                        weight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  RecipeRating(recipe: recipe),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: RecipeImageWithLike<RecipeModel>(
                          recipe: state.trendMain!,
                          getPhotoUrl: (recipe) => state.trendMain!.photo,
                          height: 143.h,
                          width: 358.w,
                          shadow: false,
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
