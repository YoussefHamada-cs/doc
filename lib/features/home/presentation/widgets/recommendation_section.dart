  import 'package:duc/core/helper/spacing.dart';
import 'package:duc/core/widgets/custom_list_view_vertical.dart';
import 'package:duc/features/home/presentation/widgets/custom_header.dart';
import 'package:duc/features/home/presentation/widgets/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:duc/features/home/domain/controllers/home_cubit/home_state.dart';
import 'package:duc/features/home/data/models/doctor_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key, required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: CustomHeader(title: 'Recommendation Doctor', onTap: () {}),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(
          child: Skeletonizer(
            enabled: state is HomeLoading,
            child: CustomListViewVertical(
              itemCount: state is HomeSuccess
                  ? (state as HomeSuccess).doctors.length
                  : 10,
              itemBuilder:(BuildContext context, int index) {
                 if (state is HomeSuccess) {
      return RecommendationDoctorItem(
        doctor: (state as HomeSuccess).doctors[index],
      );
    }
    return RecommendationDoctorItem(
      doctor: DoctorModel(
        name: 'Doctor Name Placeholder',
        degree: 'Degree',
        email: 'email@example.com',
      ),
    );
              },
            ),
          ),
        ),
      ],
    );
  }
}