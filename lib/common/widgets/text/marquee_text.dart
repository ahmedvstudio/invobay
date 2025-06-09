// import 'package:flutter/material.dart';
// import 'package:invobay/core/utils/constants/sizes.dart';
//
// import '../../../core/utils/constants/colors.dart';
//
// class MarqueeText extends StatelessWidget {
//   const MarqueeText({
//     super.key,
//     required this.longText,
//     this.textColor = VColors.white,
//     this.onTap,
//     this.backgroundColor = VColors.onPrimary,
//   });
//
//   final String longText;
//   final Color textColor;
//   final VoidCallback? onTap;
//   final Color backgroundColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           border: Border.all(color: VColors.primary),
//         ),
//         width: double.infinity,
//         height: VSizes.defaultSpace,
//         child: Marquee(
//           text: longText,
//           style:
//               Theme.of(context).textTheme.bodyMedium!.apply(color: textColor),
//           scrollAxis: Axis.horizontal,
//           textDirection: TextDirection.ltr,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           blankSpace: 20.0,
//           velocity: 50.0,
//           startPadding: 10.0,
//         ),
//       ),
//     );
//   }
// }
