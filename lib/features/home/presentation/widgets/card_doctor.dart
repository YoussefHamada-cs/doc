import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardDoctor extends StatelessWidget {
  const CardDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 167.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/svgs/Background.svg',
              fit: BoxFit.fill,
            ),
          ),

          Positioned(
            left: 16.w,
            top: 16.h,
            bottom: 16.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: AppTextStyles.fonts18w500,
                ),
                SizedBox(
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Find Nearby',
                      style: AppTextStyles.fonts12w400mainBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: 190.w,
              height: 190.h, // ← أكبر من الكارت عشان تطلع فوق
              child: Image.asset(
                'assets/images/doctor1.png',
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
