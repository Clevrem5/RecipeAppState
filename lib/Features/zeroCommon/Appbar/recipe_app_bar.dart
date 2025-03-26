import 'package:flutter/material.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_actions.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar_vector.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBar({
    super.key,
    required this.title,
    this.actions,
    this.toolbarHeight = 72,
    this.bottom,
  });

  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  final List<Widget>? actions;

  @override
  Size get preferredSize {
    final double? bottomHeight = bottom?.preferredSize.height;
    final height =
        bottomHeight == null ? toolbarHeight : bottomHeight + toolbarHeight;
    return Size(double.infinity, height);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      child: AppBar(
        leadingWidth: 30,
        centerTitle: true,
        leading: RecipeAppBarVector(),
        title: Text(
          title,
        ),
        actions: actions ?? [RecipeActions()],
        bottom: bottom,
      ),
    );
  }
}
