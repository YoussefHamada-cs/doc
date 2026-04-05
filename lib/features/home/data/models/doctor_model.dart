import 'package:duc/core/api/end_point.dart';
import 'city_model.dart';

class DoctorModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final String? degree;
  final DoctorSpecializationModel? specialization;
  final CityModel? city;
  final int? appointPrice;
  final String? startTime;
  final String? endTime;

  DoctorModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json[ApiKey.id] as int?,
        name: json[ApiKey.name] as String?,
        email: json[ApiKey.email] as String?,
        phone: json[ApiKey.phone] as String?,
        photo: json[ApiKey.photo] as String?,
        gender: json[ApiKey.gender] as String?,
        address: json[ApiKey.address] as String?,
        description: json[ApiKey.description] as String?,
        degree: json[ApiKey.degree] as String?,
        specialization: json[ApiKey.specialization] != null
            ? DoctorSpecializationModel.fromJson(
                json[ApiKey.specialization] as Map<String, dynamic>)
            : null,
        city: json[ApiKey.city] != null
            ? CityModel.fromJson(json[ApiKey.city] as Map<String, dynamic>)
            : null,
        appointPrice: json[ApiKey.appointPrice] as int?,
        startTime: json[ApiKey.startTime] as String?,
        endTime: json[ApiKey.endTime] as String?,
      );
}

class DoctorSpecializationModel {
  final int? id;
  final String? name;

  DoctorSpecializationModel({this.id, this.name});

  factory DoctorSpecializationModel.fromJson(Map<String, dynamic> json) =>
      DoctorSpecializationModel(
        id: json[ApiKey.id] as int?,
        name: json[ApiKey.name] as String?,
      );
}
