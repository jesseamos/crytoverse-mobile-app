import 'package:coinranking/features/dashboard/presentation/screens/coin_detail_screen.dart';
import 'package:coinranking/features/dashboard/presentation/screens/home_screen.dart';
import 'package:coinranking/features/dashboard/presentation/screens/main_dashboard.dart';
import 'package:go_router/go_router.dart';
import 'package:coinranking/core/config/global_keys.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: HomeScreen.routeName,
  routes: [
    GoRoute(
      path: MainDashboardScreen.routeName,
      name: MainDashboardScreen.routeName,
      builder: (context, state) => const MainDashboardScreen(),
    ),
    GoRoute(
      path: HomeScreen.routeName,
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: CoinDetailScreen.routeName,
      name: CoinDetailScreen.routeName,
      builder: (context, state) {
        final String coinId = state.extra as String;
        return CoinDetailScreen(coinId: coinId);
      },
    ),
  ],
);
