import 'package:ecommerce/controller/product/counter_detail_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/share/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterProductDetail extends GetView<CounterDetailControllerImp> {
  const CounterProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            controller.add();
          },
          icon: const Icon(AppIcon.add),
        ),
        Container(
          width: 40,
          height: 25,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColorText.titleProductDetail,
              ),
            ),
          ),
          child: GetBuilder<CounterDetailControllerImp>(
            builder: (controller) {
              return CustomLoadingWidget(
                statusRequest: controller.statusRequest,
                child: Text(
                  controller.counter.toString(),
                  style: AppStyle.styleSemiBold16(context).copyWith(
                      color: Color(controller.colorValue),
                      fontFamily: ConstantTextFons.sans),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
        IconButton(
          onPressed: () {
            controller.remove();
          },
          icon: const Icon(AppIcon.remove),
        ),
      ],
    );
  }
}
