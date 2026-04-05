import 'package:duc/core/api/end_point.dart';
import 'package:duc/core/helper/flutter_secure_storage_service.dart';
import 'package:duc/core/routing/app_routes.dart';
import 'package:duc/core/routing/app_transitions.dart';
import 'package:duc/features/auth/presentation/views/register_view.dart';
import 'package:duc/features/home/presentation/views/home_view.dart';
import 'package:duc/features/auth/presentation/views/log_in_view.dart';
import 'package:duc/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation:
        FlutterSecureStorageService().getSecureData(key: ApiKey.token) == ""
        ? AppRoutes.onboarding
        : AppRoutes.home,
    routes: [
      // ----------------------- Public routes (no bottom nav) -----------------------
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: OnBoardingView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.logIn,
        name: AppRoutes.logIn,
        pageBuilder: (context, state) => AppTransitions.slideFromLeft(
          context: context,
          state: state,
          child: LogInView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.register,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: RegisterView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: HomeView(),
        ),
      ),
    ],
  );
}
