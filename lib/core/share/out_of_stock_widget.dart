import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutOfStockWidget extends StatelessWidget {
  final Widget child;
  final bool isOutOfStock;

  const OutOfStockWidget({
    super.key,
    required this.child,
    this.isOutOfStock = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white
              .withOpacity(0.5), // White background with half transparency
          child: Opacity(
            opacity: 0.4, // Reduce opacity if out of stock
            child: child,
          ),
        ),
        _buildSticker(context),
      ],
    );
  }

  Widget _buildSticker(BuildContext context) {

    final isArabic = Localizations.localeOf(context).languageCode == ConstantLanguage.ar;
    // final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Positioned(
      top: 8,
      left: isArabic ? null : 8,
      right: isArabic ? 8 : null,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          KeyLanguage.outOfStock.tr,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
