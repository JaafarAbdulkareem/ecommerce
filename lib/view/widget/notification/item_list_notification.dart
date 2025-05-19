import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
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
    return SizedBox(
      height: 110,
      child: Card(
        child: Center(
          child: ListTile(
            title: Text(
              data.title,
              style: AppStyle.styleSemiBold16(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              data.body,
              style: AppStyle.styleBold14(context),
              maxLines: 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              Jiffy.parse(data.timeCreate, pattern: 'yyyy-MM-dd').fromNow(),
              style: AppStyle.styleBold12(context).copyWith(
                color: AppColor.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
