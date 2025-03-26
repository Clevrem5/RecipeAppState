import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_state.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';

import '../../../../Core/utils/colors.dart';
import '../../../zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';
import '../../../zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

class TopChefsProfileDetail extends StatelessWidget {
  const TopChefsProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: RecipeAppBar(
        title: "Neil",
        actions: [
          RecipeAppBarActionContainerButton(
            callback: () {},
            icon: "assets/icons/share.svg",
          ),
          SizedBox(
            width: 5,
          ),
          RecipeAppBarActionContainerButton(
            callback: () {},
            icon: "assets/icons/threedot.svg",
          ),
        ],
      ),
      body: BlocBuilder<TopChefsProfileBloc, TopChefsProfileState>(
        builder: (context, state) {
          return switch(state.profileStatus) {
            TopChefsProfileStatus.idle => Text('loaded'),
            TopChefsProfileStatus.loading => Center(child: CircularProgressIndicator(),),
            TopChefsProfileStatus.success => Column(
              children: [
                Image.network(
                  state.userInfo!.image,
                ),
              ],
            ),
            TopChefsProfileStatus.error => Text('Something went wrong...'),
          };
        },
      ),
      // body:
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
