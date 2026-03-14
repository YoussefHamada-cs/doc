import 'package:duc/core/helper/spacing.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:duc/features/auth/presentation/widgets/donot_have_an_account.dart';
import 'package:duc/features/auth/presentation/widgets/log_in_form.dart';
import 'package:duc/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome Back', style: AppTextStyles.fonts24mainBlue),
              verticalSpace(8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last\n logged in.',
                style: AppTextStyles.fonts13w400grey,
              ),
              verticalSpace(30),
              LogInForm(),
              verticalSpace(40),
              TermsAndConditions(),
              verticalSpace(20),
              DonotHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
