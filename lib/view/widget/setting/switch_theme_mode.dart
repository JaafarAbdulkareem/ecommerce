import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwichThemeMode extends GetView<SettingControllerImp> {
  const SwichThemeMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.changeThemeMode();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: controller.isDarkMode.value ? Colors.black : Colors.white,
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          child: Stack(
            children: [
              Positioned(
                left: controller.isDarkMode.value ? 10 : 60,
                top: 10,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: controller.isDarkMode.value
                      ? Row(
                          key: const ValueKey("moon"),
                          children: const [
                            Icon(Icons.nightlight_round, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow, size: 12),
                          ],
                        )
                      : const Icon(Icons.wb_sunny,
                          color: Colors.amber, key: ValueKey("sun")),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                alignment: controller.isDarkMode.value
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
