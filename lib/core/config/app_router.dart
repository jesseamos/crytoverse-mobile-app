import 'package:coinranking/features/dashboard/presentation/screens/main_dashboard.dart';
import 'package:go_router/go_router.dart';
import 'package:coinranking/core/config/global_keys.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: MainDashboardScreen.routeName,
  routes: [
    GoRoute(
      path: MainDashboardScreen.routeName,
      name: MainDashboardScreen.routeName,
      builder: (context, state) => const MainDashboardScreen(),
    ),
  ],
);
