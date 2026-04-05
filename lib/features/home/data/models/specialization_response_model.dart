import 'package:duc/core/api/end_point.dart';
import 'specialization_model.dart';

class SpecializationResponseModel {
  final String? message;
  final List<SpecializationModel>? data;
  final bool? status;
  final int? code;

  SpecializationResponseModel({this.message, this.data, this.status, this.code});

  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      SpecializationResponseModel(
        message: json[ApiKey.message] as String?,
        data: json[ApiKey.data] != null
            ? (json[ApiKey.data] as List)
                .map((specialization) =>
                    SpecializationModel.fromJson(specialization as Map<String, dynamic>))
                .toList()
            : null,
        status: json[ApiKey.status] as bool?,
        code: json[ApiKey.code] as int?,
      );
}
