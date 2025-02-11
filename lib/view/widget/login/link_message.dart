import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class LinkMessage extends StatelessWidget {
  const LinkMessage({
    super.key,
    required this.message,
    required this.link,
    required this.onTap,
  });
  final String message, link;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: AppStyle.styleLight14(context),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            link,
            style: AppStyle.styleSemiBold14(context),
          ),
        ),
      ],
    );
  }
}
