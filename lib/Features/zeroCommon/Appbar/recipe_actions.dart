import 'package:flutter/material.dart';

import 'recipe_app_bar_action_container_button.dart';

class RecipeActions extends StatelessWidget {
  const RecipeActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        RecipeAppBarActionContainerButton(
          callback: () {},
          icon: "assets/icons/notification.svg",
        ),
        RecipeAppBarActionContainerButton(
          callback: () {},
          icon: "assets/icons/search.svg",
          height: 19,
        ),
      ],
    );
  }
}
