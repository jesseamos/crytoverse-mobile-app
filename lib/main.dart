import 'package:coinranking/core/config/app_router.dart';
import 'package:coinranking/core/config/app_theme.dart';
import 'package:coinranking/di.dart';
import 'package:coinranking/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => serviceLocator<DashboardCubit>()),
          ],

          child: MaterialApp.router(
            title: 'Crytoverse',
            theme: AppTheme.darkTheme,
            routerConfig: appRouter,
          ),
        );
      },
    );
  }
}
