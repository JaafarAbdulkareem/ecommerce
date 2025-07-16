import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/home/title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressDetailOrder extends GetView<DetailOrderControllerImp> {
  const ShippingAddressDetailOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final address = controller.detailOrderData.address!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleSectionWidget(title: "${KeyLanguage.addressTitle.tr} : "),
        Text(
          "${address.city} ${address.street}\n ${address.detailAddress}",
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.surfaceContainerHighest,
          ),
        ),
      ],
    );
  }
}
