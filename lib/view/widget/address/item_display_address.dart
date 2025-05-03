import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
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
    return SizedBox(
      height: 130,
      child: Card(
        color: AppColor.card,
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 12),
            trailing: IconButton(
              onPressed: deleteTap,
              icon: Icon(
                AppIcon.delete,
              ),
            ),
            title: Text(
              data.typeAddress,
              style: AppStyle.styleSemiBold14(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
            subtitle: Text(
              "${data.city} ${data.street} \n ${data.detailAddress}",
              style: AppStyle.styleLight14(context),
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
