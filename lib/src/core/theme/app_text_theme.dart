import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppTextTheme {
  static const textTheme = TextTheme(
    // Display TextStyles
    displayLarge: TextStyle(
      fontSize: 47.78,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 39.81,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontSize: 33.18,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      fontSize: 27.65,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 23.04,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 19.20,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontSize: 16.00,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontSize: 13.33,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.00,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 13.33,
      fontWeight: FontWeight.w400,
    ),
  );
}
