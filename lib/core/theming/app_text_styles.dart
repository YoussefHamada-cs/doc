import 'package:duc/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle fonts24w700black = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF000000),
  );
  static TextStyle fonts32mainBlue = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.mainBlue,
  );
  static TextStyle fonts24mainBlue = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlue,
  );
  static TextStyle fonts18w700black = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF000000),
  );
  static TextStyle fonts18w500 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle fonts13w400grey = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );
  static TextStyle fonts12w400mainBlue = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.mainBlue,
  );
  static TextStyle fonts11w400grey = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );
  static TextStyle fonts16w600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}
