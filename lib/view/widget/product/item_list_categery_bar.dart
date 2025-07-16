import 'package:flutter/material.dart';

class ItemListCategeryBar extends StatelessWidget {
  const ItemListCategeryBar({
    super.key,
    required this.name,
    required this.onTap,
    required this.selected,
  });

  final String name;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final TextStyle textStyle = theme.textTheme.titleMedium!.copyWith(
        color: selected
            ? theme.textTheme.titleMedium?.color
            : theme.colorScheme.primary);

    final Color backgroundColor = selected
        ? theme.colorScheme.primary
        : theme.colorScheme.surfaceContainerHighest;

    return Card(
      elevation: 5,
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Text(
            name,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
