import 'package:duc/core/api/end_point.dart';

class GovernrateModel {
  final int? id;
  final String? name;

  GovernrateModel({this.id, this.name});

  factory GovernrateModel.fromJson(Map<String, dynamic> json) => GovernrateModel(
        id: json[ApiKey.id] as int?,
        name: json[ApiKey.name] as String?,
      );
}
