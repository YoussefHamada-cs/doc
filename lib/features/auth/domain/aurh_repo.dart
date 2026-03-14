import 'package:dartz/dartz.dart';
import 'package:duc/features/auth/data/models/log_in_model/log_in_model.dart';

//import 'package:image_picker/image_picker.dart';

abstract class AuthRepo {
  Future<Either<String, LogInModel>> signIn({
    required String email,
    required String password,
  });

  // Future<Either<String, SignUpModel>> signUp({
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String name,
  //   required String phone,

  //   required XFile profilePic,
  // });
  // Future<Either<String, UserProfileGetModel>> getUserProfile();
}
