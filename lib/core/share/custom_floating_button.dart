// import 'package:ecommerce/core/constant/constant_scale.dart';
// import 'package:flutter/material.dart';

// class CustomFloatingButton extends StatelessWidget {
//   const CustomFloatingButton({
//     super.key,
//     required this.icon,
//     required this.onTap,
//   });

//   final IconData icon;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final backgroundColor = theme.floatingActionButtonTheme.backgroundColor;
//     final foregroundColor = theme.floatingActionButtonTheme.foregroundColor;

//     return IconButton(
//       icon: Icon(
//         icon,
//         size: ConstantScale.iconShop,
//         color: foregroundColor,
//       ),
//       style: IconButton.styleFrom(
//         backgroundColor: backgroundColor,
//         padding: const EdgeInsets.all(8),
//         shape: const CircleBorder(),
//       ),
//       onPressed: onTap,
//     );
//   }
// }
