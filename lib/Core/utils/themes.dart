import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppThemes {

  static final darkTheme = ThemeData(
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.beigeColor,
      foregroundColor: AppColors.redPinkMain,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontFamily: "Poppins",
        color: AppColors.redPinkMain,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.redPinkMain,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.white,
      surface: AppColors.beigeColor,
      onSurface: Colors.white,
    ),
  );
}