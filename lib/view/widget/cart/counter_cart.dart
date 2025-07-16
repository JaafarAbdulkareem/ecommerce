import 'package:ecommerce/controller/cart/counter_cart_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/share/custom_loading_widget.dart';
import 'package:ecommerce/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterCart extends StatelessWidget {
  const CounterCart({
    super.key,
    required this.index,
    required this.count,
  });

  final int index;
  final CartModel count;

  @override
  Widget build(BuildContext context) {
    CounterCartControllerImp controller = Get.put(CounterCartControllerImp());

    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displayLarge?.copyWith(
      fontFamily: ConstantTextFons.sans,
    );
    final primary = theme.colorScheme.primary;

    return Column(
      children: [
        IconButton(
          onPressed: () {
            controller.increment(index);
          },
          icon: Icon(
            AppIcon.add,
            color: primary,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: theme.dividerColor),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          alignment: Alignment.center,
          child: GetBuilder<CounterCartControllerImp>(
            id: count.id,
            builder: (controller) {
              return CustomLoadingWidget(
                statusRequest: controller.statusRequest,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    count.count.toString(),
                    style: textStyle,
                  ),
                ),
              );
            },
          ),
        ),
        IconButton(
          onPressed: () {
            controller.decrement(index);
          },
          icon: Icon(
            AppIcon.remove,
            color: primary,
          ),
        ),
      ],
    );
  }
}
