import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/MyRecipes/presentation/manager/my-recipes_bloc.dart';
import 'package:recipeapp3/Features/MyRecipes/presentation/manager/my-recipes_state.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../../CategoriesDetail/presentation/widgets/category_detail_info.dart';

class MyRecipesView extends StatelessWidget {
  const MyRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: 'Your Recipes'),
      body: BlocBuilder<MyRecipesBloc, MyRecipesState>(
        builder: (context, state) => switch (state.status) {
          MyRecipesStatus.error => Text('Something went error...'),
          MyRecipesStatus.loading => Center(child: LinearProgressIndicator()),
          MyRecipesStatus.idle => Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,),
            child: GridView.builder(
              // key: ValueKey<List<RecipeModel>>(state.recipes!),
              padding: EdgeInsets.only(bottom: 150.h, top: 20.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 226.h,
                mainAxisSpacing: 30.h,
                crossAxisSpacing: 18.w,
              ),
              itemCount: state.myRecipes!.length,
              itemBuilder: (context, index) => CategoryDetailInfo(recipe: state.myRecipes![index]),
            ),
          ),
          null => Text('null'),
        },
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
