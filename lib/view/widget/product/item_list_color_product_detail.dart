import 'package:flutter/material.dart';

class ItemListColorProductDetail extends StatelessWidget {
  const ItemListColorProductDetail({
    super.key,
    required this.select,
    required this.title,
    required this.onTap,
  });

  final bool select;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final Color selectedBackground = colorScheme.primary;

    final Color unselectedBackground = theme.cardColor;
    final Color unselectedBorderColor = colorScheme.surfaceContainerHighest;
    final Color unselectedTextColor =
        theme.textTheme.bodyMedium?.color ?? Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: select ? selectedBackground : unselectedBackground,
              border: Border.all(
                color: unselectedBorderColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: select ? null : unselectedTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
