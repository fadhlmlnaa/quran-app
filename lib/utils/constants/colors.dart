import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFEF6C35); //orange
const Color primaryLightColor = Color(0xFFFFA500);
const Color secondaryColor = Color(0xFF720455);
const Color secondaryLightColor = Color.fromARGB(255, 174, 19, 125);
const Color textPrimary = Colors.black; //black
const Color textSecondary = Colors.black54; //semi black
const Color textWhite = Colors.white; //white
const Color textLight = Colors.white54;
const Color darkBackground = Color.fromARGB(255, 24, 0, 45);

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    surfaceTint: Colors.white,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: primaryColor,
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      color: textPrimary,
    ),
    labelMedium: TextStyle(
      color: textSecondary,
    ),
    labelSmall: TextStyle(
      color: textSecondary,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: primaryColor,
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    dividerColor: Colors.transparent,
    labelColor: primaryLightColor,
    labelStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    unselectedLabelColor: textSecondary,
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: primaryLightColor,
    inactiveTrackColor: Colors.white,
    thumbColor: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: secondaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: darkBackground,
    surfaceTintColor: Colors.black,
  ),
  scaffoldBackgroundColor: darkBackground,
  colorScheme: const ColorScheme.dark(
    surfaceTint: Colors.black,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: secondaryColor,
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      color: textWhite,
    ),
    labelMedium: TextStyle(
      color: textLight,
    ),
    labelSmall: TextStyle(
      color: textLight,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: secondaryColor,
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    dividerColor: Colors.transparent,
    labelColor: secondaryLightColor,
    labelStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    unselectedLabelColor: textLight,
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: secondaryColor,
  ),
  cardTheme: const CardTheme(
    color: Color(0xff030637),
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: secondaryLightColor,
    inactiveTrackColor: Colors.white,
    thumbColor: Colors.white,
  ),
);
