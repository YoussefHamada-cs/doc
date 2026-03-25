import 'package:duc/core/helper/custom_show_snack_bar.dart';
import 'package:duc/core/helper/validator.dart';
import 'package:duc/core/routing/app_routes.dart';
import 'package:duc/core/theming/app_colors.dart';
import 'package:duc/core/theming/app_text_styles.dart';
import 'package:duc/core/widgets/circular_loading.dart';
import 'package:duc/core/widgets/custom_button.dart';
import 'package:duc/features/auth/domain/controllers/user_cubit/auth_cubit.dart';
import 'package:duc/features/auth/domain/controllers/user_cubit/auth_state.dart';
import 'package:duc/features/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late String email, password;
  final key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) => email = value!,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [NoArabicInputFormatter()],
            hintText: 'Email',
            validator: Validator.email,
          ),
          CustomTextFormField(
            hintText: 'Password',
            onSaved: (value) => password = value!,
            validator: Validator.password,
            obscureText: isObscureText,
            inputFormatters: [NoArabicInputFormatter()],
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
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SuccessLogIn) {
                customShowSnackBar(context, 'Success');
                context.pushNamed(AppRoutes.home);
              } else if (state is FailureLogIn) {
                customShowSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return state is LoadingLogIn
                  ? CircularLoading()
                  : CustomButton(
                      text: 'Login',
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                          context.read<AuthCubit>().signIn(
                            email: email,
                            password: password,
                          );
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
