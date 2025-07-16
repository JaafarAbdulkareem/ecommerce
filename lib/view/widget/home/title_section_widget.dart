import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleSectionWidget extends StatelessWidget {
  const TitleSectionWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 6,
      ),
      child: Text(
        title.tr,
        style: theme.textTheme.displaySmall,
      ),
    );
  }
}
