
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, youssef!', style: AppTextStyles.fonts18w700black),
            Text('How Are you Today?', style: AppTextStyles.fonts11w400grey),
          ],
        ),
        SvgPicture.asset('assets/svgs/Notification.svg'),
     
      ],
    );
  }
}
