import 'package:duc/core/helper/spacing.dart';
import 'package:duc/core/widgets/custom_list_view_horizontal.dart';
import 'package:duc/core/widgets/custom_list_view_vertical.dart';
import 'package:duc/features/home/presentation/widgets/card_doctor.dart';
import 'package:duc/features/home/presentation/widgets/custom_header.dart';
import 'package:duc/features/home/presentation/widgets/doctor_speciality_item.dart';
import 'package:duc/features/home/presentation/widgets/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:duc/features/home/presentation/widgets/app_bar_home_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AppBarHomeWidget()),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverToBoxAdapter(child: CardDoctor()),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverToBoxAdapter(
            child: CustomHeader(title: 'Doctor Specialities', onTap: () {}),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90.h,
              child: CustomListViewHorizontal(
                itemBuilder: (context, index) {
                  return DoctorSpecialityItem();
                },
                itemCount: 10,
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverToBoxAdapter(
            child: CustomHeader(title: 'Recommendation Doctor', onTap: () {}),
          ),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverToBoxAdapter(
            child: CustomListViewVertical(
              itemBuilder: (context, index) {
                return RecommendationDoctorItem();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
