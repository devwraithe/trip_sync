import 'package:flutter/material.dart';

class Constants {
  // String
  static String fontFamily = "Neue";
  static String socketError = "No Internet Connection";
  static String unknownError = "Something went wrong";
  static String timeoutError = "Timeout";

  static double hrPadding = 20;
  static double vrPadding = 34;
  static double tripImgWidth = double.infinity;
  static double tripImgHeight = 380;

  static double radius = 8; // buttons and fields

  static Radius tripImageRadius = const Radius.circular(18);

  static EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: hrPadding,
    vertical: vrPadding,
  );

  // Other
  static AutovalidateMode validateMode = AutovalidateMode.onUserInteraction;
}
