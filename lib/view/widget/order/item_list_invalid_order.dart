import 'package:ecommerce/controller/order/invalid_order_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/data/models/order_model/invalid_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListInvalidOrder extends StatelessWidget {
  const ItemListInvalidOrder({
    super.key,
    required this.index,
    required this.data,
  });
  final int index;
  final InvalidOrderModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GetBuilder<InvalidOrderControllerImp>(
      id: ConstantKey.idInvalidButton,
      builder: (controller) {
        print("$index invalid re building");
        return Card(
          color: theme.cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    data.name,
                    style: textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(width: 22),
                Expanded(
                  child: Text(
                    data.count.toString(),
                    style: textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: data.isClick
                      ? const SizedBox()
                      : Row(
                          children: [
                            Expanded(
                              child: CustomButtonWidget(
                                text: KeyLanguage.injectButton.tr,
                                color: theme.colorScheme.error,
                                onTap: () {
                                  controller.inject(index);
                                },
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: CustomButtonWidget(
                                text: KeyLanguage.acceptButton.tr,
                                color: theme.colorScheme.secondary,
                                onTap: () {
                                  controller.accept(index);
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
