import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_state.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import '../../../zeroCommon/Appbar/recipe_app_bar_action_container_button.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size(double.infinity, 72);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopChefsProfileBloc, TopChefsProfileState>(
      builder: (context, state) {
        if (state.profileStatus == TopChefsProfileStatus.success) {
          return RecipeAppBar(
            title: "@${state.userInfo!.firstName}",
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
          );
        } else {
          return Center(
            child: LinearProgressIndicator(),
          );
        }
      },
    );
  }
}
