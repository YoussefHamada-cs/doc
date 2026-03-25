import 'package:duc/core/helper/custom_show_snack_bar.dart';
import 'package:duc/core/helper/validator.dart';
import 'package:duc/core/routing/app_routes.dart';
import 'package:duc/core/theming/app_colors.dart';
import 'package:duc/core/widgets/circular_loading.dart';
import 'package:duc/core/widgets/custom_button.dart';
import 'package:duc/features/auth/domain/controllers/user_cubit/auth_cubit.dart';
import 'package:duc/features/auth/domain/controllers/user_cubit/auth_state.dart';
import 'package:duc/features/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late String email, password, userName, phoneNumber;
  final key = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  bool isObscurePassword = true;
  bool isObscureConfirmation = true;
  bool isChecked = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) => userName = value!,
            keyboardType: TextInputType.name,
            inputFormatters: [NoArabicInputFormatter()],
            hintText: 'User Name',
            validator: Validator.username,
          ),
          CustomTextFormField(
            onSaved: (value) => phoneNumber = value!,

            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\+\-\(\)\s]')),
            ],
            hintText: 'Phone Number',
            validator: Validator.phoneNumber,
          ),
          CustomTextFormField(
            onSaved: (value) => email = value!,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [NoArabicInputFormatter()],
            hintText: 'Email',
            validator: Validator.email,
          ),
          CustomTextFormField(
            hintText: 'Password',
            controller: passwordController,
            onSaved: (value) => password = value!,
            validator: Validator.password,
            obscureText: isObscurePassword,
            inputFormatters: [NoArabicInputFormatter()],
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
              child: Icon(
                isObscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppColors.lightGray,
              ),
            ),
          ),
          CustomTextFormField(
            hintText: 'Password Confirmation',
            onSaved: (value) => password = value!,
            validator: (value) {
              if (value == null || value.isEmpty) return "Enter confirmation";
              if (value != passwordController.text) {
                return "Passwords don't match";
              }
              return null;
            },
            obscureText: isObscureConfirmation,
            inputFormatters: [NoArabicInputFormatter()],
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureConfirmation = !isObscureConfirmation;
                });
              },
              child: Icon(
                isObscureConfirmation ? Icons.visibility_off : Icons.visibility,
                color: AppColors.lightGray,
              ),
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SuccessRegister) {
                customShowSnackBar(context, 'Success');
                context.goNamed(AppRoutes.home);
              } else if (state is FailureRegister) {
                customShowSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return state is LoadingRegister
                  ? CircularLoading()
                  : CustomButton(
                      text: 'Create Account',
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                          context.read<AuthCubit>().register(
                            email: email,
                            password: password,
                            userName: userName,
                            phoneNumber: phoneNumber,
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
