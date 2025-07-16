import 'package:flutter/material.dart';

class TitleDescriptionWidget extends StatelessWidget {
  const TitleDescriptionWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: theme.textTheme.displayLarge,
      ),
      subtitle: Text(
        subTitle,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}
