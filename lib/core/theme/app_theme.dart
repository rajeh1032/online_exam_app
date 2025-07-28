import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData getTheme(
      {required ColorScheme colorScheme, required Color textFieldBorderColor}) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.secondary),
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorScheme.secondary,
        ),
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: TextStyle(
            color: colorScheme.secondary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.secondary,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.secondary,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: colorScheme.secondary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.secondary,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.secondary,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.secondary,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            color: textFieldBorderColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        labelStyle: TextStyle(color: textFieldBorderColor),
        floatingLabelStyle: TextStyle(color: textFieldBorderColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: textFieldBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: textFieldBorderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: textFieldBorderColor),
        ),
      ),
    );
  }

  static ThemeData lightTheme = getTheme(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.blue,
          onPrimary: AppColors.white,
          secondary: AppColors.black,
          onSecondary: AppColors.white,
          error: AppColors.red,
          onError: AppColors.white,
          surface: AppColors.white,
          onSurface: AppColors.black),
      textFieldBorderColor: AppColors.gray);

  // static ThemeData darkTheme = getTheme(const ColorScheme(
  //     brightness: Brightness.dark,
  //     primary: AppColors.black,
  //     onPrimary: AppColors.white,
  //     secondary: AppColors.black,
  //     onSecondary: AppColors.white,
  //     error: AppColors.red,
  //     onError: AppColors.white,
  //     surface: AppColors.blue,
  //     onSurface: AppColors.white));
}
