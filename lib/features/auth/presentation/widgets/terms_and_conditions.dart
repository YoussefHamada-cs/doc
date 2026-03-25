import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'By logging in, you agree to our ',
        style: AppTextStyles.fonts13w400grey,
        children: [
          TextSpan(
            text: 'Terms & Conditions',
            style: AppTextStyles.fonts13w400grey.copyWith(color: Colors.black),
          ),
          TextSpan(text: ' and ', style: AppTextStyles.fonts13w400grey),
          TextSpan(
            text: 'PrivacyPolicy',
            style: AppTextStyles.fonts13w400grey.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
