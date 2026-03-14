import 'package:dartz/dartz.dart';
import 'package:duc/core/api/api_consumer.dart';
import 'package:duc/core/api/end_point.dart';
import 'package:duc/core/errors/exception.dart';
import 'package:duc/features/auth/data/models/log_in_model/log_in_model.dart';
import 'package:duc/features/auth/domain/aurh_repo.dart';

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
      // final decodedToken = JwtDecoder.decode(logInModel.token);
      // CacheHelper().saveData(key: ApiKey.token, value: logInModel.token);
      // CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

      return Right(logInModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message ?? 'there was an error');
    }
  }

  // @override
  // Future<Either<String, SignUpModel>> signUp({
  //   required String email,
  // required String password,
  //  required String confirmPassword,
  //  required String name,
  //  required String phone,
  //   required XFile profilePic})async {
  //  try {
  //     final response = await apiConsumer.post(EndPoint.signUp,
  //         data: {
  //           ApiKey.name: name,
  //           ApiKey.email: email,
  //           ApiKey.phone: phone,
  //           ApiKey.password: password,
  //           ApiKey.confirmPassword: confirmPassword,
  //           ApiKey.location:
  //               '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}', // Assuming a default location
  //           ApiKey.profilePic: await uploadImageToAPI(profilePic),
  //         },
  //         isFormData: true);
  //     final signUpModel = SignUpModel.fromJson(response);

  //     return Right(signUpModel);
  //   } on ServerException catch (e) {
  //     return Left(e.errorModel.errorMessage);
  //   }
  // }
}
