import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemThemeModeSetting extends StatelessWidget {
  const ItemThemeModeSetting({
    super.key,
    required this.title,
    required this.switchWidget,
  });
  final String title;
  final Widget switchWidget;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        title.tr,
        style: theme.textTheme.displaySmall
            ?.copyWith(color: theme.bottomAppBarTheme.shadowColor),
      ),
      trailing: switchWidget,
    );
  }
}
