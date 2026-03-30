import 'package:duc/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctorItem extends StatelessWidget {
  const RecommendationDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126.h,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/Image.png',
            fit: BoxFit.contain,

            alignment: Alignment.center,
          ),
          horizontalSpace(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. John Doe',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                'Doctor of Medicine',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    '5.0',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    ' (400 reviews)',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
