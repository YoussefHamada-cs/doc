import 'package:dartz/dartz.dart';
import 'package:duc/core/api/api_consumer.dart';
import 'package:duc/core/api/end_point.dart';
import 'package:duc/core/errors/exception.dart';
import 'package:duc/features/home/data/models/specialization_response_model.dart';
import 'package:duc/features/home/domain/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer apiConsumer;
  HomeRepoImpl(this.apiConsumer);
  @override
  Future<Either<String, SpecializationResponseModel>> getHome() async {
    try {
      final response = await apiConsumer.get(EndPoint.homeIndex);
      final specializationResponseModel = SpecializationResponseModel.fromJson(
        response,
      );
      return Right(specializationResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.message ?? 'there was an error');
    }
  }
}
