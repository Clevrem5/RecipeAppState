import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/navigation/paths.dart';
import '../../../../Core/data/models/categories_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    Widget image = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image(
          image: CachedNetworkImageProvider(category.image),
          width: category.isMain ? 356 : 160,
          height: category.isMain ? 150 : 145,
          fit: BoxFit.cover,
        ),
      ),
    );

    Widget title = Text(category.title);

    return GestureDetector(
      onTap: () {
        context.push(Routes.categoryDetail, extra: category);
      },
      child: Column(
        children: [
          category.isMain ? title : image,
          const SizedBox(height: 5),
          category.isMain ? image : title,
        ],
      ),
    );
  }
}
