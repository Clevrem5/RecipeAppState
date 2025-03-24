import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../Auth/presentation/manager/singupViewModel.dart';

class RecipeDataTextField extends StatelessWidget {
  const RecipeDataTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var data = context.watch<SignUpViewModel>().selectedData;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextFor(text: "Date of Birth", size: 15),
          RecipeAppText(data: "data Of Birth", line: 1,color: Colors.white, size: 15.sp),
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                builder: (context, child) => Theme(
                  data: ThemeData(
                    colorScheme: ColorScheme.dark(
                      primary: AppColors.pinkSub,
                      onPrimary: Colors.white,
                      secondary: AppColors.pinkColor,
                      onSecondary: Colors.black,
                      error: Colors.red,
                      onError: Colors.white,
                      surface: Colors.white,
                      onSurface: AppColors.beigeColor,
                    ),
                  ),
                  child: child!,
                ),
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null) {
                context.read<SignUpViewModel>().selectedData = pickedDate;
              }
            },
            child: Container(
              width: 357,
              height: 48,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 36),
              decoration: BoxDecoration(
                color: AppColors.pinkColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: RecipeAppText(
                line: 1,
                data: data == null ? "DD/MM/YYYY" : "${data.day}/${data.month}/${data.year}",
                color: AppColors.beigeColor.withValues(
                  alpha: data == null ? 0.5 : 1,
                ),
                size: 16.sp,
              ),
              // child: TextFor(
              //   text: data == null
              //       ? "DD/MM/YYYY"
              //       : "${data.day}/${data.month}/${data.year}",
              //   size: 16,
              //   color: RecipeColors.backRoundColor.withOpacity(data == null ? 0.5 : 1),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
