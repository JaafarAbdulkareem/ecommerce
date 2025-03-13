import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/share/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterCart extends GetView<CartControllerImp> {
  const CounterCart({
    super.key,
    required this.index,
    required this.count,
  });
  final int index, count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            controller.increment(index);
          },
          icon: const Icon(AppIcon.add),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          width: 30,
          height: 30,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColorText.titleProductDetail),
            ),
          ),
          alignment: Alignment.center,
          child: GetBuilder<CartControllerImp>(
            builder: (controller) {
              return CustomLoadingWidget(
                statusRequest: StatusRequest.success,
                // statusRequest: controller.statusRequest,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    count.toString(),
                    style: AppStyle.styleSemiBold20(context).copyWith(
                        color: Color(controller.colorValue),
                        fontFamily: ConstantTextFons.sans),
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
          icon: const Icon(
            AppIcon.remove,
          ),
        ),
      ],
    );
  }
}
