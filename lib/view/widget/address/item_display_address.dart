import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/data/models/setting_model/address_model.dart';
import 'package:flutter/material.dart';

class ItemDisplayAddress extends StatelessWidget {
  const ItemDisplayAddress({
    super.key,
    required this.data,
    required this.deleteTap,
  });

  final AddressModel data;
  final VoidCallback deleteTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 130,
      child: Card(
        color: theme.cardColor,
        child: Center(
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 12),
            trailing: IconButton(
              onPressed: deleteTap,
              icon: Icon(
                AppIcon.delete,
                color: theme.iconTheme.color,
              ),
            ),
            title: Text(
              data.typeAddress,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
            subtitle: Text(
              "${data.city} ${data.street} \n ${data.detailAddress}",
              style: theme.textTheme.bodySmall,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
