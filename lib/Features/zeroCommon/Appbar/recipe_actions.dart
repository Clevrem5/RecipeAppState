import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Core/navigation/paths.dart';
import 'recipe_app_bar_action_container_button.dart';

class RecipeActions extends StatelessWidget {
  const RecipeActions({
    super.key,
    this.svg = "assets/icons/notification.svg",
    this.svg2 = "assets/icons/search.svg",
    this.callback,
    this.callback2,
  });

  final String svg, svg2;
  final VoidCallback? callback, callback2;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        RecipeAppBarActionContainerButton(
          callback: callback ??
              () {
                context.push(Routes.notifications);
              },
          icon: svg,
        ),
        RecipeAppBarActionContainerButton(
          callback: callback2 ?? () {Routes.createRecipe;},
          icon: svg2,
          height: 19,
        ),
      ],
    );
  }
}
