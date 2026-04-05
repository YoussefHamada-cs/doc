import 'package:duc/core/helper/flutter_secure_storage_service.dart';
import 'package:duc/core/helper/spacing.dart';
import 'package:duc/core/routing/app_routes.dart';
import 'package:duc/features/home/presentation/widgets/card_doctor.dart';
import 'package:duc/features/home/presentation/widgets/recommendation_section.dart';
import 'package:duc/features/home/presentation/widgets/specialities_section.dart';
import 'package:flutter/material.dart';
import 'package:duc/features/home/presentation/widgets/app_bar_home_widget.dart';
import 'package:duc/core/di/get_it_sevice.dart';
import 'package:duc/features/home/domain/controllers/home_cubit/home_cubit.dart';
import 'package:duc/features/home/domain/controllers/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  ElevatedButton(
                    onPressed: () {
                      FlutterSecureStorageService().deleteSecureData(
                        key: 'token',
                      );
                      context.go(AppRoutes.logIn);
                    },
                    child: Text("log out"),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: AppBarHomeWidget()),
                SliverToBoxAdapter(child: verticalSpace(20)),
                SliverToBoxAdapter(child: CardDoctor()),
                SliverToBoxAdapter(child: verticalSpace(20)),
                SpecialitiesSection(state: state),
                SliverToBoxAdapter(child: verticalSpace(20)),
                RecommendationSection(state: state),
              ],
            ),
          );
        },
      ),
    );
  }
}
