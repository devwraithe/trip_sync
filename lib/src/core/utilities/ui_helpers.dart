import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_theme.dart';
import 'constants.dart';

class UiHelpers {
  static tripImageRadius(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Constants.tripImageRadius,
        topRight: Constants.tripImageRadius,
      ),
      child: child,
    );
  }

  static tripImage(String image) {
    return tripImageRadius(
      Image.network(
        image,
        fit: BoxFit.cover,
        height: Constants.tripImgHeight,
        width: Constants.tripImgWidth,
      ),
    );
  }

  static tripImageCover() {
    return tripImageRadius(
      Container(
        height: Constants.tripImgHeight,
        width: Constants.tripImgWidth,
        color: AppColors.black.withOpacity(0.4),
      ),
    );
  }

  static tripContent() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "JAN 25, 2018",
            style: AppTextTheme.textTheme.titleLarge?.copyWith(
              color: AppColors.grey30,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Meeting with Elon Musk in San Francisco",
            style: AppTextTheme.textTheme.headlineLarge?.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  static switchPassword(void Function()? onTap, bool obscurePassword) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        obscurePassword == true ? Iconsax.eye_slash : Iconsax.eye,
        size: 20,
      ),
    );
  }

  // Notifications, dialogs and snackbars
  static successFlush(
    String message,
    BuildContext context,
  ) async {
    return Flushbar(
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
          color: AppColors.white,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.green10,
      flushbarPosition: FlushbarPosition.BOTTOM,
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
    )..show(context);
  }

  static errorFlush(
    String message,
    BuildContext context,
  ) async {
    return Flushbar(
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
          color: AppColors.white,
        ),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.red10,
      flushbarPosition: FlushbarPosition.BOTTOM,
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
    )..show(context);
  }
}
