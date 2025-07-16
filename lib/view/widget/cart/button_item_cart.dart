import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

class ButtonItemCart extends StatelessWidget {
  const ButtonItemCart({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          child: Icon(
            icon,
            size: ConstantScale.icon,
            color:  primary,
          ),
        ),
      ),
    );
  }
}
