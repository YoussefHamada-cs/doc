import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:duc/features/home/domain/home_repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  void getHomeData() async {
    emit(HomeLoading());
    final result = await homeRepo.getHome();
    result.fold((error) => emit(HomeError(error)), (response) {
      final specializations = response.data ?? [];
      if (specializations.isNotEmpty) {
        emit(
          HomeSuccess(
            specializations: specializations,
            doctors: specializations.first.doctors ?? [],
            selectedSpecializationId: specializations.first.id ?? 0,
          ),
        );
      } else {
        emit(
          HomeSuccess(
            specializations: [],
            doctors: [],
            selectedSpecializationId: 0,
          ),
        );
      }
    });
  }

  void filterDoctorsBySpecialization(int specializationId) {
    if (state is HomeSuccess) {
      final currentState = state as HomeSuccess;
      final specialization = currentState.specializations.firstWhere(
        (s) => s.id == specializationId,
        orElse: () => currentState.specializations.first,
      );
      emit(
        HomeSuccess(
          specializations: currentState.specializations,
          doctors: specialization.doctors ?? [],
          selectedSpecializationId: specializationId,
        ),
      );
    }
  }
}
