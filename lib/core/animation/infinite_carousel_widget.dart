import 'package:ecommerce/controller/animation/infinite_carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfiniteCarouselWidget<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
// final Widget child;
  const InfiniteCarouselWidget({
    super.key,
    required this.items, 
    // required this.child,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final tag = items.hashCode.toString();
    final controller = Get.put(InfiniteCarouselController(items), tag: tag);

    // Start auto-slide after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startAutoSlide();
    });

    // return child; 
    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        reverse: controller.isRTL, // Important for RTL support
        itemBuilder: (context, index) {
          
          final realIndex = index % items.length;
          return itemBuilder(items[realIndex]);
        },
      ),
    );
  }
}
