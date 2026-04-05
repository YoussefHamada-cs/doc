import 'package:dartz/dartz.dart';
import 'package:duc/features/home/data/models/specialization_response_model.dart';

abstract class HomeRepo {
  Future<Either<String, SpecializationResponseModel>> getHome();
}