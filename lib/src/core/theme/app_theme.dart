import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'app_button_theme.dart';
import 'app_color_scheme.dart';
import 'app_text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: Constants.fontFamily,
    colorScheme: AppColorScheme.lightColorScheme,
    scaffoldBackgroundColor: AppColorScheme.lightColorScheme.background,
    textTheme: AppTextTheme.textTheme,
    filledButtonTheme: AppButtonTheme.filledButtonTheme,
    useMaterial3: true,
  );
}
