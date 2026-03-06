import 'package:duc/core/routing/app_routes.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:duc/core/widgets/custom_button.dart';
import 'package:duc/features/onboarding/presentation/widgets/doc_image_and_text_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/docdoc_logo.svg'),
            Text('Ducduc', style: AppTextStyles.fonts24w700black),
          ],
        ),
        SizedBox(height: 30.h),
        DocImageAndTextOnboarding(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
            textAlign: TextAlign.center,
            style: AppTextStyles.fonts13w400grey,
          ),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 8.0),
          child: CustomButton(
            text: 'Get Started',
            onPressed: () {
              context.pushNamed(
                AppRoutes.logIn,
              ); // Navigate to the login screen
              // Handle button press
            },
          ),
        ),
      ],
    );
  }
}
