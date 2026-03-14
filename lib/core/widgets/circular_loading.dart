
import 'package:duc/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 26,
        width: 26,
        child: const CircularProgressIndicator(
          color: AppColors.mainBlue,
        ),
      );
  }
}
