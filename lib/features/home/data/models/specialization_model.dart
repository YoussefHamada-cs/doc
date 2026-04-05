import 'package:duc/core/api/end_point.dart';
import 'doctor_model.dart';

class SpecializationModel {
  final int? id;
  final String? name;
  final List<DoctorModel>? doctors;

  SpecializationModel({this.id, this.name, this.doctors});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      SpecializationModel(
        id: json[ApiKey.id] as int?,
        name: json[ApiKey.name] as String?,
        doctors: json[ApiKey.doctors] != null
            ? (json[ApiKey.doctors] as List)
                .map((doctor) => DoctorModel.fromJson(doctor as Map<String, dynamic>))
                .toList()
            : null,
      );
}
