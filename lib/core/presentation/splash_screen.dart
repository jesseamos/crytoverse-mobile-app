// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:coinranking/core/config/colors_constant.dart';
// import 'package:coinranking/core/icons/get_started_svgs_path.dart';
// import 'package:coinranking/core/presentation/svg_icon.dart';
// import 'package:coinranking/core/utils/user_storage.dart';
// import 'package:coinranking/features/auth/presentation/screens/get_started.dart';
// import 'package:coinranking/features/dashboard/presentation/screens/main_dashboard.dart';

// class SplashScreen extends StatefulWidget {
//   static const String routeName = '/splash';
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _pulse;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..repeat(reverse: true);
//     _pulse = Tween<double>(
//       begin: 0.95,
//       end: 1.05,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

//     // Kick off background auto-login check
//     _bootstrap();
//   }

//   Future<void> _bootstrap() async {
//     // small delay to show splash
//     await Future.delayed(const Duration(milliseconds: 600));
//     final storage = UserStorage();
//     final token = await storage.jwtOrEmpty;
//     final user = await storage.userData;

//     if (!mounted) return;
//     if (token.isNotEmpty && user != null) {
//       context.go(MainDashboardScreen.routeName);
//     } else {
//       context.go(GetStarted.routeName);
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ScaleTransition(
//               scale: _pulse,
//               child: Column(
//                 children: [
//                   Container(
//                     height: 80,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       color: ColorsConstant.black,
//                       border: Border.all(
//                         width: 4,
//                         color: ColorsConstant.grey.withOpacity(0.5),
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Center(
//                       child: Image.asset('assets/images/networkX-avatar.png'),
//                     ),
//                   ),
//                   SizedBox(height: 8.h),
//                   SvgIcon(svgPath: networkXTitleIcon),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
