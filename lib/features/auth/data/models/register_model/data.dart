import 'package:duc/core/api/end_point.dart';

class Data {
  String? token;
  String? username;

  Data({this.token, this.username});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json[ApiKey.token] as String?,
    username: json[ApiKey.username] as String?,
  );
}
