import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppStyles {
  // Regular
  static final TextStyle regular12 = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black[0],
  );

  static final TextStyle regular14 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black[0],
  );

  static final TextStyle regular18White = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  // Light
  static final TextStyle light14Hint = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.black[30],
  );

  static final TextStyle light16White = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
  );

  static final TextStyle light18Hint = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.black[30],
  );

  // Medium
  static final TextStyle medium14 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black[0],
  );

  static final TextStyle medium14Light = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black[20],
  );

  static final TextStyle medium18 = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black[0],
  );

  static final TextStyle medium18White = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final TextStyle medium20White = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  // SemiBold
  static final TextStyle semi16White = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final TextStyle semi20Blue = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blue[0],
  );

  static final TextStyle semi24White = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}
