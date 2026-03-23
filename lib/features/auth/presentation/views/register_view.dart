import 'package:duc/core/di/get_it_sevice.dart';
import 'package:duc/features/auth/domain/controllers/user_cubit/auth_cubit.dart';
import 'package:duc/features/auth/presentation/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => getIt<AuthCubit>(),
        child: RegisterViewBody(),
      ),
    );
  }
}
