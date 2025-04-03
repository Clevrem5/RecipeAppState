import 'package:flutter/material.dart';

import '../../CategoriesDetail/presentation/manager/category_detail_view_model.dart';
import '../../CategoriesDetail/presentation/widgets/categories_detail_appbar_bottom_items.dart';

class RecipeAppbarBottom extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppbarBottom({
    super.key,
    required this.vm,
  });

  final CategoryDetailViewModel vm;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.hardEdge,
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: [
          for (var category in vm.categories)
            CategoriesDetailAppbarBottomItems(
              title: category.title,
              callback: () => vm.selected = category,
              isSelected: category.id == vm.selected.id,
            ),
        ],
      ),
    );
  }
}
