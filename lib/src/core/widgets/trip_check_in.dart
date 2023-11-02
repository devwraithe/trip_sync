// import 'package:flutter/material.dart';
//
// import '../../../core/theme/app_colors.dart';
// import '../../../core/theme/app_text_theme.dart';
//
// class TripCheckIn extends StatelessWidget {
//   const TripCheckIn({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     const textTheme = AppTextTheme.textTheme;
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         vertical: 22,
//         horizontal: 18,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               ClipRRect(
//                 child: Image.network(
//                   "https://skift.com/wp-content/uploads/2013/10/lufthansa.jpg",
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "CHECK IN",
//                     style: textTheme.titleLarge,
//                   ),
//                   const SizedBox(height: 1),
//                   Text(
//                     "Your trip is tomorrow",
//                     style: textTheme.titleLarge?.copyWith(
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.grey20,
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: AppColors.orange20,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 8,
//             ),
//             child: Text(
//               "Check in",
//               style: textTheme.titleLarge?.copyWith(
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.orange10,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
