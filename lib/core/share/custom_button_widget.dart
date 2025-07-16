import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  final String text;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: onTap,
      style:
          color != null ? TextButton.styleFrom(backgroundColor: color) : null,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}
