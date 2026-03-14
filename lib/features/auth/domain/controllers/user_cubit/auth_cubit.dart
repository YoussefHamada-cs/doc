import 'package:duc/features/auth/data/models/log_in_model/log_in_model.dart';
import 'package:duc/features/auth/domain/controllers/user_cubit/auth_state.dart';
import 'package:duc/features/auth/domain/aurh_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo userRepo;
  AuthCubit({required this.userRepo}) : super(AuthInitial());

  //Profile Pic
  XFile? profilePic;

  LogInModel? signInModel;
  // updateProfilePic(XFile image) {
  //   profilePic = image;
  //   emit(ProfilePicUpdated());
  // }
  // Future signUp() async {
  //   emit(LoadingSignUp());

  //     final response = await userRepo.signUp(
  //       email: signUpEmail.text,
  //       password: signUpPassword.text,
  //       confirmPassword: confirmPassword.text,
  //       name: signUpName.text,
  //       phone: signUpPhoneNumber.text,

  //       profilePic: profilePic!,
  //     );
  //     response.fold(
  //       (errorMessage) => emit(FailureSignUp(errorMessage: errorMessage)),
  //       (signUpModel) =>
  //         emit(SuccessSignUp(successMessage: signUpModel.message)),
  //     );

  // }

  Future signIn({required String email, required String password}) async {
    emit(LoadingLogIn());

    final response = await userRepo.signIn(email: email, password: password);
    response.fold(
      (errorMessage) => emit(FailureLogIn(errorMessage: errorMessage)),
      (signInModel) => emit(SuccessLogIn()),
    );
  }
}
