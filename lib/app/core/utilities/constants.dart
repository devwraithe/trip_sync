import 'package:flutter/material.dart';

class Constants {
  static String fontFamily = "Neue";

  static double hrPadding = 20;
  static double vrPadding = 34;
  static double tripImgWidth = double.infinity;
  static double tripImgHeight = 380;

  static Radius tripImageRadius = const Radius.circular(18);

  static EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: hrPadding,
    vertical: vrPadding,
  );
}
