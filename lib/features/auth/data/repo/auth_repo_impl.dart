import 'package:dartz/dartz.dart';
import 'package:duc/core/api/api_consumer.dart';
import 'package:duc/core/api/end_point.dart';
import 'package:duc/core/errors/exception.dart';
import 'package:duc/features/auth/data/models/log_in_model/log_in_model.dart';
import 'package:duc/features/auth/data/models/register_model/register_model.dart';
import 'package:duc/features/auth/domain/repo/aurh_repo.dart';

//import 'package:image_picker/image_picker.dart';
//import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepoImpl implements AuthRepo {
  final ApiConsumer apiConsumer;

  UserRepoImpl({required this.apiConsumer});

  // @override
  // Future<Either<String, UserProfileGetModel>> getUserProfile()async {
  //    try {
  //     final response = await apiConsumer.get(EndPoint.getUserDataEndPoint(
  //         CacheHelper().getData(key: ApiKey.id)));
  //     final userProfileGetModel = UserProfileGetModel.fromJson(response);
  //     return Right(userProfileGetModel);
  //   } on ServerException catch (e) {
  //     return Left(e.errorModel.errorMessage);
  //   }
  // }

  @override
  Future<Either<String, LogInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.signIn,
        isFormData: true,
        data: {ApiKey.email: email, ApiKey.password: password},
      );
      final logInModel = LogInModel.fromJson(response);

      return Right(logInModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message ?? 'there was an error');
    }
  }

  @override
  Future<Either<String, RegisterModel>> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.register,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.phone: phone,
          ApiKey.password: password,
          ApiKey.confirmPassword: confirmPassword,
          ApiKey.gender: 0,
        },
        isFormData: true,
      );
      final registerModel = RegisterModel.fromJson(response);

      return Right(registerModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message ?? 'there was an error');
    }
  }
}
