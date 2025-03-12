import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../manager/categories_View_model.dart';
import 'category_item.dart';

class CategoryPageBody extends StatelessWidget {
  const CategoryPageBody({
    super.key,
    required this.vm,
  });

  final CategoriesBloc vm;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: 25,
        top: 20,
        right: 25,
        bottom: 150,
      ),
      children: [
        if (vm.mainCategory != null)
          CategoryItem(
            category: vm.mainCategory!,

          ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 5,
            mainAxisExtent: 170,
          ),
          itemCount: vm.categories.length,
          itemBuilder: (context, index) => CategoryItem(
            category: vm.categories[index],
          ),
        ),
      ],
    );
  }
}
