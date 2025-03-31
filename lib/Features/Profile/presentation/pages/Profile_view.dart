import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/Profile/presentation/manager/profile_bloc.dart';
import 'package:recipeapp3/Features/Profile/presentation/manager/profile_state.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../../CategoriesDetail/presentation/widgets/category_detail_info.dart';
import '../../../zeroCommon/Appbar/recipe_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(

      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) => switch (state.recipeStatus) {
          ProfileStatus.idle => Text('Loaded...'),
          ProfileStatus.loading =>
              Center(child: LinearProgressIndicator()),
          ProfileStatus.success => Expanded(
            child: GridView.builder(
              // key: ValueKey<List<RecipeModel>>(state.recipes!),
              padding: EdgeInsets.only(bottom:  150.h,top: 20.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 226.h,
                mainAxisSpacing: 30.h,
                crossAxisSpacing: 18.w,
              ),
              itemCount: state.recipes!.length,
              itemBuilder: (context, index) => CategoryDetailInfo(recipe: state.recipes![index]),
            ),
          ),
          ProfileStatus.error => Text('Something went wrong...'),
        },
      )
      ,
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
