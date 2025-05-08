import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 85,
        child: Card(
          color: isActive ? AppColor.primary : AppColor.optionCheckout,
          child: Center(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 12),
              title: Text(
                data.typeAddress,
                style: AppStyle.styleSemiBold14(context).copyWith(
                  color: isActive
                      ? AppColorText.textButton
                      : AppColorText.titleProductDetail,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              subtitle: Text(
                "${data.city} ${data.street} \n ${data.detailAddress}",
                style: AppStyle.styleLight14(context).copyWith(
                  color: isActive
                      ? AppColorText.textButton
                      : AppColorText.titleProductDetail,
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
