import 'package:duc/core/helper/spacing.dart';
import 'package:duc/core/widgets/custom_list_view_horizontal.dart';
import 'package:duc/features/home/presentation/widgets/custom_header.dart';
import 'package:duc/features/home/presentation/widgets/doctor_speciality_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:duc/features/home/domain/controllers/home_cubit/home_cubit.dart';
import 'package:duc/features/home/domain/controllers/home_cubit/home_state.dart';
import 'package:duc/features/home/data/models/specialization_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';


class SpecialitiesSection extends StatelessWidget {
  const SpecialitiesSection({super.key, required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: CustomHeader(title: 'Doctor Specialities', onTap: () {}),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.h,
            child: Skeletonizer(
              enabled: state is HomeLoading,
              child: CustomListViewHorizontal(
                itemCount: state is HomeSuccess
                    ? (state as HomeSuccess).specializations.length
                    : 10,
                itemBuilder: (BuildContext context, int index) {
    if (state is HomeSuccess) {
      final s = (state as HomeSuccess);
      final spec = s.specializations[index];
      return DoctorSpecialityItem(
        specialization: spec,
        isSelected: s.selectedSpecializationId == spec.id,
        onTap: () => context
            .read<HomeCubit>()
            .filterDoctorsBySpecialization(spec.id ?? 0),
      );
    }
    return DoctorSpecialityItem(
      specialization: SpecializationModel(name: 'Speciality Name'),
      isSelected: false,
      onTap: () {},
    );
  },
              ),
            ),
          ),
        ),
      ],
    );
  }
}