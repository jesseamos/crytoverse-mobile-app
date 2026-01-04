import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff101213),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff8E9BAE),
      ),
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xff101213),

      titleTextStyle: TextStyle(fontSize: 14.sp, color: Color(0xff8E9BAE)),
    ),
    fontFamily: "Nunito Sans",
    primaryColor: ColorsConstant.primaryBlack,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsConstant.darkgrey, // Darker navbar background
      selectedItemColor: ColorsConstant.blue, // Vibrant blue for active icon
      unselectedItemColor:
          ColorsConstant.greyText, // Muted grey for inactive icons
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(size: 22),
      unselectedIconTheme: const IconThemeData(size: 22),
      elevation: 0,
    ),
  );
}
