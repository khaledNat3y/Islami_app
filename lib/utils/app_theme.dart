import 'package:flutter/material.dart';
import 'app_colors.dart';
abstract class AppTheme {
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlack,
  );
  static const TextStyle mediumTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.lightBlack,
  );
  static const TextStyle regularTitleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.lightBlack,
  );
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.orange,
    dividerColor: AppColors.orange,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.transparent,
      titleTextStyle: appBarTextStyle.copyWith(color: AppColors.lightBlack),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.lightBlack,
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 26)
    ),
    textTheme: TextTheme(
      bodySmall: regularTitleTextStyle.copyWith(color: AppColors.lightBlack),
      bodyMedium: mediumTitleTextStyle.copyWith(color: AppColors.lightBlack),
      bodyLarge: appBarTextStyle.copyWith(color: AppColors.lightBlack),
    ),
    cardColor: AppColors.lightBlack,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.orange))),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    primaryColor: AppColors.primiaryDark,
    dividerColor: AppColors.accentDark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      titleTextStyle: appBarTextStyle.copyWith(color: AppColors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accentDark,
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 26)
    ),
    textTheme: TextTheme(
      bodySmall: regularTitleTextStyle.copyWith(color: AppColors.white,),
      bodyMedium: mediumTitleTextStyle.copyWith(color: AppColors.white),
      bodyLarge: appBarTextStyle.copyWith(color: AppColors.white),
    ),
    cardColor: AppColors.lightBlack,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff141A2E)))),
  );

}