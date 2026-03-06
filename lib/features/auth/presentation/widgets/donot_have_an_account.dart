
import 'package:duc/core/routing/app_routes.dart';
import 'package:duc/core/theming/app_colors.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DonotHaveAnAccount extends StatelessWidget {
  const DonotHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: AppTextStyles.fonts13w400grey,
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.home);
          },
          child: Text(
            'Sign Up',
            style: AppTextStyles.fonts13w400grey.copyWith(
              color: AppColors.mainBlue,
            ),
          ),
        ),
      ],
    );
  }
}
