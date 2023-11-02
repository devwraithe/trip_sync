// import 'package:flutter/material.dart';
// import 'package:trip_sync/app/core/theme/app_colors.dart';
// import 'package:trip_sync/app/core/theme/app_text_theme.dart';
// import 'package:trip_sync/app/core/utilities/ui_helpers.dart';
// import 'package:trip_sync/app/presentation/widgets/trip_check_in.dart';
//
// class Trip extends StatelessWidget {
//   const Trip({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const text = AppTextTheme.textTheme;
//
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.grey.withOpacity(0.14),
//             blurRadius: 14.0,
//             spreadRadius: 0.0,
//             offset: const Offset(0, 4),
//           ),
//         ],
//         borderRadius: BorderRadius.circular(18),
//       ),
//       margin: const EdgeInsets.only(bottom: 28),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               UiHelpers.tripImage(
//                 "https://images3.alphacoders.com/676/676584.jpg",
//               ),
//               UiHelpers.tripImageCover(),
//               UiHelpers.tripContent(),
//             ],
//           ),
//           const TripCheckIn(),
//         ],
//       ),
//     );
//   }
// }
