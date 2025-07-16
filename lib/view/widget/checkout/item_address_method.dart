import 'package:ecommerce/data/models/setting_model/address_model.dart';
import 'package:flutter/material.dart';

class ItemAddressMethod extends StatelessWidget {
  const ItemAddressMethod({
    super.key,
    required this.data,
    required this.isActive,
    required this.onTap,
  });
  final AddressModel data;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final backgroundColor =
        isActive ? colorScheme.primary : colorScheme.surfaceContainerHighest;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 85,
        child: Card(
          color: backgroundColor,
          child: Center(
            child: ListTile(
              title: Text(
                data.typeAddress,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: isActive ? null : theme.colorScheme.primary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              subtitle: Text(
                "${data.city} ${data.street} \n${data.detailAddress}",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: isActive ? null : theme.colorScheme.primary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
