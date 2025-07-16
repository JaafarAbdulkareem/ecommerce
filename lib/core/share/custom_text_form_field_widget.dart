import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.maxLines = 1,
    required this.hint,
    required this.label,
    required this.icon,
    required this.controller,
    this.onTap,
    this.validator,
    this.obscure = false,
    this.keyboardType,
    this.changeCasePassword,
  });

  final int? maxLines;
  final String hint, label;
  final IconData icon;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final bool obscure;
  final TextInputType? keyboardType;
  final VoidCallback? changeCasePassword;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: validator,
        onTap: onTap,
        obscureText: obscure,
        keyboardType: keyboardType,
        obscuringCharacter: ConstantText.obscureText,
        style: theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              label,
              style: theme.textTheme.titleLarge,
            ),
          ),
          hintText: hint,
          hintStyle: theme.textTheme.bodyMedium,
          suffixIcon:
              icon == AppIcon.closePassword || icon == AppIcon.openPassword
                  ? IconButton(
                      onPressed: changeCasePassword,
                      icon: Icon(
                        obscure ? AppIcon.closePassword : AppIcon.openPassword,
                        color: theme.iconTheme.color,
                      ),
                    )
                  : Icon(
                      icon,
                      color: theme.iconTheme.color,
                    ),
        ),
      ),
    );
  }
}
