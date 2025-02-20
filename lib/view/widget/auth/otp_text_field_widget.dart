import 'package:ecommerce/controller/auth/verification_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpTextFieldWidget extends GetView<VerificationController> {
  const OtpTextFieldWidget({
    super.key,
    required this.onTap,
  });
  final void Function(String)? onTap;
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      clearText: true,
      numberOfFields: ConstantScale.otpNumber,
      borderRadius: BorderRadius.circular(24),
      focusedBorderColor: AppColor.primary,
      showFieldAsBox: true,
      onSubmit: onTap,
    );
  }
}
