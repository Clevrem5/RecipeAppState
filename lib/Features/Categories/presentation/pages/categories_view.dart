import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_actions.dart';
import 'package:recipeapp3/Features/Categories/presentation/widgets/category_page-body.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../manager/categories_View_model.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(430, 932));
    final vm = context.watch<CategoriesBloc>();
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: "Categories",
          actions: [
            RecipeActions(),

          ],

        ),
        body: CategoryPageBody(vm: vm),
        bottomNavigationBar: RecipeBottomNavigation(),
      ),
    );
  }
}
