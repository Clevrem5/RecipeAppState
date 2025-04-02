import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_text_field_simple.dart';

import '../../../../Core/utils/colors.dart';
import 'following_part_users.dart';

class FollowingPart extends StatelessWidget {
  const FollowingPart({
    super.key,
    required this.contr,
  });

  final TextEditingController contr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          RecipeTextFieldSimple(
            validator: (value) => null,
            controller: contr,
            width: 355,
            height: 34,
            hint: 'Search',
            isCenter: false,
            textColor: AppColors.redPinkMain,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: 200.h),
              children: List.generate(
                10,
                (index) => SizedBox.fromSize(
                  size: Size(0, 75.h),
                  child: Column(
                    children: [
                      FollowingPartUsers(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
