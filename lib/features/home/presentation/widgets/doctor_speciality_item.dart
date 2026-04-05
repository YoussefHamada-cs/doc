import 'package:duc/core/helper/spacing.dart';
import 'package:duc/core/theming/app_colors.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:duc/features/home/data/models/specialization_model.dart';

class DoctorSpecialityItem extends StatelessWidget {
  final SpecializationModel specialization;
  final bool isSelected;
  final VoidCallback onTap;

  const DoctorSpecialityItem({
    super.key,
    required this.specialization,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: isSelected
                ? AppColors.mainBlue
                : AppColors.morelightGray,
            child: Icon(
              Icons.medical_services_outlined,
              color: isSelected ? Colors.white : AppColors.mainBlue,
              size: 28.r,
            ),
          ),
          verticalSpace(4),
          Text(
            specialization.name ?? 'Speciality',
            textAlign: TextAlign.center,
            style: AppTextStyles.fonts12w400mainBlue.copyWith(
              color: isSelected ? AppColors.mainBlue : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
