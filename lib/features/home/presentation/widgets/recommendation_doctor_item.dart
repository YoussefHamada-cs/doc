import 'package:duc/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:duc/core/theming/app_text_styles.dart';
import 'package:duc/features/home/data/models/doctor_model.dart';

class RecommendationDoctorItem extends StatelessWidget {
  final DoctorModel doctor;
  const RecommendationDoctorItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              doctor.photo ?? 'https://via.placeholder.com/150',
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/Image.png',
                width: 110.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name ?? 'Dr. Name',
                  style: AppTextStyles.fonts16w600,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(4),
                Text(
                  '${doctor.degree} | ${doctor.specialization?.name}',
                  style: AppTextStyles.fonts12w400mainBlue,
                ),
                verticalSpace(4),
                Text(
                  doctor.email ?? '',
                  style: AppTextStyles.fonts12w400mainBlue,
                ),
                verticalSpace(8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18.r),
                    horizontalSpace(4),
                    Text(
                      '4.8 (4,279 reviews)',
                      style: AppTextStyles.fonts12w400mainBlue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
