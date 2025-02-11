import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    required this.controller,
    this.onTap,
    this.validator,
    this.obscure = false,
    this.keyboardType,
  });
  final String hint, label;
  final IconData icon;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final bool obscure;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onTap: onTap,
        obscureText: obscure,
        keyboardType: keyboardType,
        obscuringCharacter: ConstantText.obscureText,
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.symmetric(horizontal: 24),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              label,
              style: AppStyle.styleLight16(context),
            ),
          ),
          hintText: hint,
          hintStyle: AppStyle.styleLight14(context),
          suffixIcon: Icon(icon),
          isDense: true,
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        color: AppColor.secondary,
      ),
    );
  }
}
