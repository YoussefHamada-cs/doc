import 'package:duc/core/helper/spacing.dart';
import 'package:duc/core/theming/app_colors.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: AppColors.morelightGray,
          child: Image.asset(
            'assets/images/Man Doctor Europe 1.png',
            fit: BoxFit.contain,
            width: 28.r,
            height: 28.r,
            alignment: Alignment.center,
          ),
        ),
        verticalSpace(4),
        Text(
          'General',
          textAlign: TextAlign.center,
          style: AppTextStyles.fonts12w400mainBlue.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
