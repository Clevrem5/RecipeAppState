import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipe-detail-state.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipe_detail_bloc.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/widgets/recipe_detail_part.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/widgets/recipe_detail_video_player.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_actions.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../widgets/recipe_detail_ingredient_section.dart';
import '../widgets/recipe_page_titles.dart';
import '../widgets/recipe_user_following.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailBloc, RecipeDetailState>(
      builder: (context, state) {
        switch (state.status) {
          case RecipeDetailStatus.loading:
            return const Center(child: CircularProgressIndicator());

          case RecipeDetailStatus.error:
            return const Center(child: Text("Error loading recipe"));

          case RecipeDetailStatus.initial:
            return const Center(child: Text("Preparing to load..."));

          case RecipeDetailStatus.idle:
            final recipe = state.recipes;
            if (recipe == null) {
              return const Center(child: Text("No recipe data available"));
            }

            return Scaffold(
              extendBody: true,
              appBar: RecipeAppBar(
                title: recipe.title,
                actions: [
                  RecipeActions(
                    svg: "assets/icons/heart.svg",
                    svg2: "assets/icons/share.svg",
                    callback: () {},
                    callback2: () {},
                  ),
                ],
              ),
              body: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(36.w, 10.h, 36.w, 150.h),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          RecipeDetailVideoPlayer(recipe: recipe),
                          SizedBox(height: 28),
                          RecipeUserFollowing(recipe: recipe),
                          SizedBox(height: 21.h),
                          Divider(color: AppColors.pinkSub),
                          SizedBox(height: 24.h),
                          RecipeDetailPart(recipe: recipe),
                          SizedBox(height: 30.h),
                          RecipePageTitles(text: "Ingredients"),
                          SizedBox(height: 24.h),
                          RecipeDetailIngredientSection(recipe: recipe),
                          SizedBox(height: 24.h),
                          RecipePageTitles(text: '${recipe.instructions.length} Easy Steps'),
                          SizedBox(height: 11.h),
                          Column(spacing: 11.h,
                            children: List.generate(recipe.instructions.length, (index) {
                              return Container(
                                width: 356.w,
                                height: 81.h,
                                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: index % 2 == 0 ? AppColors.pinkSub : AppColors.pinkColor,
                                ),
                                child: RecipeAppText(
                                  data: '${index + 1}. ${recipe.instructions[index].text}',
                                  color: AppColors.beigeColor.withOpacity(0.90),
                                  size: 12.sp,
                                  line: 3,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: RecipeBottomNavigation(),
            );
          case null:
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      },
    );
  }
}
