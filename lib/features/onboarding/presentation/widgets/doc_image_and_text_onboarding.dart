import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DocImageAndTextOnboarding extends StatelessWidget {
  const DocImageAndTextOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/docdoc_backround_.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
            ),
          ),
          child: Image.asset('assets/images/onboarding_Image.png'),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 30,
          child: Text(
            'Best Doctor\n Appointment App',
            textAlign: TextAlign.center,
            style: AppTextStyles.fonts32mainBlue,
          ),
        ),
      ],
    );
  }
}
