import 'package:flutter/material.dart';
import 'package:trip_sync/app/core/theme/app_text_theme.dart';

import '../theme/app_colors.dart';
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
}
