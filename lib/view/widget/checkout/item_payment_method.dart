import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPaymentMethod extends GetView<CheckoutControllerImp> {
  const ItemPaymentMethod({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
  });
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final backgroundColor =
        isActive ? colorScheme.primary : colorScheme.surfaceContainerHighest;

    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 9,
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: theme.textTheme.titleMedium?.copyWith(
              color: isActive ? null : theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
