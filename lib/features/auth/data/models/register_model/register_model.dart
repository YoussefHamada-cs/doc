import 'package:duc/core/api/end_point.dart';

import 'data.dart';

class RegisterModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  RegisterModel({this.message, this.data, this.status, this.code});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    message: json[ApiKey.message] as String?,
    data: json[ApiKey.data] is Map<String, dynamic>
        ? Data.fromJson(json[ApiKey.data] as Map<String, dynamic>)
        : null,
    status: json[ApiKey.status] as bool?,
    code: json[ApiKey.code] as int?,
  );
}
