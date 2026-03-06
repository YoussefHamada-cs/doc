import 'package:duc/core/theming/app_colors.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:duc/core/widgets/custom_button.dart';
import 'package:duc/features/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late String email, password;
  final key = GlobalKey<FormState>();
  bool isObscureText = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) => email = value!,
            keyboardType: TextInputType.emailAddress,

            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          CustomTextFormField(
            hintText: 'Password',
            onSaved: (value) => password = value!,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            obscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.lightGray,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                activeColor: AppColors.mainBlue,

                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: const BorderSide(color: AppColors.lightGray),
              ),

              Text('Remember me', style: AppTextStyles.fonts13w400grey),
              Spacer(),

              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.fonts13w400grey.copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
              ),
            ],
          ),
          CustomButton(text: 'Login', onPressed: () {}),
        ],
      ),
    );
  }
}
