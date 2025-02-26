
import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/data/data_source/static/static_navigator_home_bar.dart';
import 'package:ecommerce/view/widget/home/item_home_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNavigatorBar extends StatelessWidget {
  const HomeNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return BottomAppBar(
        // notchMargin: 0,
        color: AppColor.backgroundScaffold,
        shadowColor: AppColor.primary,
        elevation: 30,
        shape: CircularNotchedRectangle(),
        height: 65,
        child: Row(
          children: List.generate(dataNavigatorBar.length + 1, (index) {
            late int i;
            if (index < 2) {
              i = index;
            } else {
              i = index - 1;
            }
            return index == 2
                ? const Spacer()
                : ItemHomeNavigatorBar(
                    data: dataNavigatorBar[i],
                    selected: i == controller.indexBar,
                    index: i,
                  );
          }),
        ),
      );
    });
  }
}
