import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });
  final String text;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: AppStyle.styleBold16(context),
      ),
    );
  }
}
