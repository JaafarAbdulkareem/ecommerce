import 'package:ecommerce/view/widget/setting/image_setting.dart';
import 'package:ecommerce/view/widget/setting/user_detail.dart';
import 'package:flutter/material.dart';

class BodySettingView extends StatelessWidget {
  const BodySettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ImageSetting(),
        Expanded(
          child: UserDetail(),
        ),
      ],
    );
  }
}
