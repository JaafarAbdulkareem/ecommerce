import 'package:ecommerce/controller/product/counter_detail_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/share/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterProductDetail extends GetView<CounterDetailControllerImp> {
  const CounterProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.titleMedium;

    final primary = theme.colorScheme.primary;
    return Row(
      children: [
        IconButton(
          onPressed: controller.add,
          icon: Icon(
            AppIcon.add,
            color: primary,
          ),
        ),
        Container(
          width: 40,
          height: 25,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: primary,
              ),
            ),
          ),
          child: GetBuilder<CounterDetailControllerImp>(
            builder: (controller) {
              return CustomLoadingWidget(
                statusRequest: controller.statusRequest,
                child: Text(
                  controller.counter.toString(),
                  textAlign: TextAlign.center,
                  style: textStyle?.copyWith(
                    color: Color(controller.colorValue),
                    fontFamily: ConstantTextFons.sans,
                  ),
                ),
              );
            },
          ),
        ),
        IconButton(
          onPressed: controller.remove,
          icon: Icon(
            AppIcon.remove,
            color: primary,
          ),
        ),
      ],
    );
  }
}
