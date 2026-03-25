import 'package:dartz/dartz.dart';
import 'package:duc/features/auth/data/models/log_in_model/log_in_model.dart';
import 'package:duc/features/auth/data/models/register_model/register_model.dart';

//import 'package:image_picker/image_picker.dart';

abstract class AuthRepo {
  Future<Either<String, LogInModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<String, RegisterModel>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,

    
  });
  
}
