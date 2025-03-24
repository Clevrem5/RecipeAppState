import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';


class RecipeNumberTextField extends StatelessWidget {
  const RecipeNumberTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    required this.controller,
    this.isView = false,
  });

  final String label, hint;
  final String? Function(String? value) validator;
  final TextEditingController controller;
  final bool isView;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        RecipeAppText(data: label, color: Colors.white, size: 15.sp,line: 1,),
        Center(
          child: TextFormField(
            validator: validator,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.pinkColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(18),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                height: 1,
                fontSize: 14,
                color: AppColors.beigeColor.withValues(alpha: 0.45),
              ),
              contentPadding: EdgeInsets.only(left: 36, right: 11),
              suffixIcon: isView == true
                  ? IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/eye.svg',
                  fit: BoxFit.cover,
                  width: 24,
                  height: 20,
                ),
              )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}