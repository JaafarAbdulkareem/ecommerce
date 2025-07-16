import 'package:flutter/material.dart';

class ItemDeliveryMethod extends StatelessWidget {
  const ItemDeliveryMethod({
    super.key,
    required this.image,
    required this.text,
    required this.isActive,
    required this.onTap,
  });
  final String image, text;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final primary =
        isActive ? colorScheme.primary : colorScheme.surfaceContainerHighest;

    final iconColor = isActive ? theme.cardColor : colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 130,
              height: 100,
              fit: BoxFit.cover,
              color: iconColor,
              colorBlendMode: BlendMode.srcIn,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: theme.textTheme.titleMedium?.copyWith(color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
