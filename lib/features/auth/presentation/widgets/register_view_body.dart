import 'package:duc/core/helper/spacing.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:duc/features/auth/presentation/widgets/already_have_an_account_yet.dart';
import 'package:duc/features/auth/presentation/widgets/register_form.dart';
import 'package:duc/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: AppTextStyles.fonts24mainBlue),
              verticalSpace(8),
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: AppTextStyles.fonts13w400grey,
              ),
              verticalSpace(20),
              RegisterForm(),
              verticalSpace(40),
              TermsAndConditions(),
              verticalSpace(20),
              AlreadyHaveAnAccountYet(),
            ],
          ),
        ),
      ),
    );
  }
}
