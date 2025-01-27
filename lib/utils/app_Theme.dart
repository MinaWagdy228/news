import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      // bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primaryLight),
      primaryColor: AppColors.whiteColor,
      indicatorColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      // drawerTheme: DrawerThemeData(backgroundColor: AppColors.blackColor),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: AppColors.blackColor)),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16Black,
          labelMedium: AppStyles.medium14Black,
          headlineLarge: AppStyles.medium20Black,
      headlineMedium: AppStyles.medium24Black)
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   elevation:0,
      //     showUnselectedLabels: true,
      //     unselectedLabelStyle: AppStyles.bold12White,
      //     selectedLabelStyle: AppStyles.bold12White),
      // floatingActionButtonTheme:
      //     const FloatingActionButtonThemeData(backgroundColor: AppColors.primaryLight)
      // appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryLight)
      );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.blackColor,
      indicatorColor: Colors.white,
      scaffoldBackgroundColor: AppColors.blackColor,
      // drawerTheme: DrawerThemeData(backgroundColor: AppColors.whiteColor),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
          iconTheme: IconThemeData(color: AppColors.whiteColor)),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          labelMedium: AppStyles.medium14White,
          headlineLarge: AppStyles.medium20White,
      headlineMedium: AppStyles.medium24White)
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     elevation:0,
      //     showUnselectedLabels: true,
      //     unselectedLabelStyle: AppStyles.bold12White,
      //     selectedLabelStyle: AppStyles.bold12White),
      // floatingActionButtonTheme:
      // const FloatingActionButtonThemeData(backgroundColor: AppColors.primaryDark)
      // appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryDark)
      );
}
