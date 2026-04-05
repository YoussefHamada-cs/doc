import 'package:duc/features/home/data/models/doctor_model.dart';
import 'package:duc/features/home/data/models/specialization_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<SpecializationModel> specializations;
  final List<DoctorModel> doctors;
  final int selectedSpecializationId;

  HomeSuccess({
    required this.specializations,
    required this.doctors,
    required this.selectedSpecializationId,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
