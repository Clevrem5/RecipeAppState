import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_actions.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_appbar_bottom.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../../../Core/data/models/recipeModels/recipe_model.dart';
import '../manager/category_detail_view_model.dart';
import '../widgets/category_detail_info.dart';

class CategoriesDetailView extends StatelessWidget {
  const CategoriesDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CategoryDetailViewModel>();
    return RefreshIndicator(
      onRefresh: () async => vm.load(),
      child: Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: vm.selected.title,
          actions: [RecipeActions()],
          bottom: RecipeAppbarBottom(vm: vm),
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            Animation<Offset> slideInAnimation = Tween<Offset>(
              begin: Offset(vm.right ? 1.0 : -1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(animation);

            Animation<Offset> slideOutAnimation = Tween<Offset>(
              begin: Offset(vm.right ? -1.0 : 1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(animation);

            if (child.key == ValueKey<List<RecipeModel>>(vm.recipes)) {
              return SlideTransition(position: slideInAnimation, child: child);
            } else {
              return SlideTransition(position: slideOutAnimation, child: child);
            }
          },
          child: GridView.builder(
            key: ValueKey<List<RecipeModel>>(vm.recipes),
            padding: EdgeInsets.fromLTRB(16, 36, 16, 120),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 226.h,
              mainAxisSpacing: 30.h,
            ),
            itemCount: vm.recipes.length,
            itemBuilder: (context, index) => CategoryDetailInfo(recipe: vm.recipes[index]),
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigation(),
      ),
    );
  }
}
