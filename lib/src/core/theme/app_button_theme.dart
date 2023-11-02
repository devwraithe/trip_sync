import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

@immutable
class AppButtonTheme {
  static final filledButtonTheme = FilledButtonThemeData(
    style: AppButtonTheme.darkThemeFilledButton,
  );

  static final darkThemeFilledButton = FilledButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Constants.radius),
    ),
    textStyle: AppTextTheme.textTheme.bodyLarge?.copyWith(
      fontFamily: Constants.fontFamily,
      color: AppColors.white,
    ),
    backgroundColor: AppColors.black,
    minimumSize: const Size(double.infinity, 55),
  );
}
