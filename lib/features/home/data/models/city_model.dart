import 'package:duc/core/api/end_point.dart';
import 'governrate_model.dart';

class CityModel {
  final int? id;
  final String? name;
  final GovernrateModel? governrate;

  CityModel({this.id, this.name, this.governrate});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json[ApiKey.id] as int?,
        name: json[ApiKey.name] as String?,
        governrate: json[ApiKey.governrate] != null
            ? GovernrateModel.fromJson(json[ApiKey.governrate] as Map<String, dynamic>)
            : null,
      );
}
