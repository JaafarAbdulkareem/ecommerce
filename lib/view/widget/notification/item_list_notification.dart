import 'package:ecommerce/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ItemListNotification extends StatelessWidget {
  const ItemListNotification({
    super.key,
    required this.data,
  });
  final NotificationModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      // height: 110,
      child: Card(
        color: theme.cardColor,
        child: Center(
          child: ListTile(
            title: Text(
              data.title,
              style: theme.textTheme.headlineSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              data.body,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.surfaceContainerHighest,
              ),
              // maxLines: 3,
              textAlign: TextAlign.justify,
              // overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              Jiffy.parse(data.timeCreate, pattern: 'yyyy-MM-dd').fromNow(),
              style: theme.textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}
