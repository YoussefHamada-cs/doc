import 'package:duc/features/auth/data/models/log_in_model/log_in_model.dart';
import 'package:duc/features/auth/domain/controllers/user_cubit/auth_state.dart';
import 'package:duc/features/auth/domain/repo/aurh_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo userRepo;
  AuthCubit({required this.userRepo}) : super(AuthInitial());

  LogInModel? signInModel;

  Future register({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
  }) async {
    emit(LoadingRegister());

    final response = await userRepo.register(
      email: email,
      password: password,
      confirmPassword: password,
      name: userName,
      phone: phoneNumber,
    );
    response.fold(
      (errorMessage) => emit(FailureRegister(errorMessage: errorMessage)),
      (signUpModel) => emit(SuccessRegister()),
    );
  }

  Future signIn({required String email, required String password}) async {
    emit(LoadingLogIn());

    final response = await userRepo.signIn(email: email, password: password);
    response.fold(
      (errorMessage) => emit(FailureLogIn(errorMessage: errorMessage)),
      (signInModel) => emit(SuccessLogIn()),
    );
  }
}
