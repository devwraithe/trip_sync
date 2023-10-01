import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppTextTheme {
  static const textTheme = TextTheme(
    // Display TextStyles
    displayLarge: TextStyle(
      fontSize: 56,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 40,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ),

    // Headline TextStyles
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),

    // Title Text Styles
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.grey,
    ),

    // Body Text Styles
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.grey,
    ),

    // Label Text Styles
    labelLarge: TextStyle(
      fontSize: 13,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    ),
  );
}
