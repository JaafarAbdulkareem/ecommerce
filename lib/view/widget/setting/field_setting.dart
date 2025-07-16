import 'package:flutter/material.dart';

class FieldSetting extends StatelessWidget {
  const FieldSetting({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = theme.bottomAppBarTheme;
    return Card(
      elevation: 4,
      color: background.surfaceTintColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: background.shadowColor,
          ),
        ),
        trailing: Icon(
          icon,
          color: background.shadowColor,
        ),
      ),
    );
  }
}
