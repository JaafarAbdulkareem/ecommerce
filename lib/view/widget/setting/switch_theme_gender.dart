import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchThemeGender extends GetView<SettingControllerImp> {
  const SwitchThemeGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.changeThemeGender();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: controller.isMale.value ? Colors.blue : Colors.pink,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Stack(
            children: [
              Positioned(
                left: controller.isMale.value ? 15 : 75,
                top: 12,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: controller.isMale.value
                      ? const Icon(Icons.boy,
                          color: Colors.white, size: 26, key: ValueKey("boy"))
                      : const Icon(Icons.girl,
                          color: Colors.white, size: 26, key: ValueKey("girl")),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                alignment: controller.isMale.value
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: controller.isMale.value
                          ? const Text("👦",
                              style: TextStyle(fontSize: 30),
                              key: ValueKey("boy"))
                          : const Text("👧",
                              style: TextStyle(fontSize: 30),
                              key: ValueKey("girl")),
                    ),
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
