import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';

class CreateReviewText extends StatelessWidget {
  const CreateReviewText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      minLines: 3,
      style: TextStyle(
        color: AppColors.beigeColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.pinkColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 16.h,
        ),
        hintText: "Leave us Review",
        hintStyle: TextStyle(
          color: AppColors.beigeColor.withValues(alpha: 0.45),
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
