import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title, required this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.fonts18w700black),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text('See All', style: AppTextStyles.fonts12w400mainBlue),
        ),
      ],
    );
  }
}
