import 'package:dio/dio.dart';
import 'package:duc/core/api/api_consumer.dart';
import 'package:duc/core/api/dio_consumer.dart';
import 'package:duc/features/auth/data/repo/auth_repo_impl.dart';
import 'package:duc/features/auth/domain/controllers/user_cubit/auth_cubit.dart';
import 'package:duc/features/auth/domain/repo/aurh_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => UserRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerFactory(() => AuthCubit(userRepo: getIt<AuthRepo>()));
}
