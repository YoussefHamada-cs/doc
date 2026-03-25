import 'package:duc/core/routing/app_routes.dart';
import 'package:duc/core/theming/app_colors.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAnAccountYet extends StatelessWidget {
  const AlreadyHaveAnAccountYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account yet? ', style: AppTextStyles.fonts13w400grey),
        GestureDetector(
          onTap: () {
            context.goNamed(AppRoutes.logIn);
          },
          child: Text(
            'LogIn',
            style: AppTextStyles.fonts13w400grey.copyWith(
              color: AppColors.mainBlue,
            ),
          ),
        ),
      ],
    );
  }
}
