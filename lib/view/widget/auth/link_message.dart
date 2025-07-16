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
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: textTheme.bodyMedium,
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onTap,
          child: Text(
            link,
            style: textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
