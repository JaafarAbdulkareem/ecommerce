import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/setting/field_setting.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FieldSetting(
          title: "king Samy",
          icon: AppIcon.username,
          onTap: () {},
        ),
        FieldSetting(
          title: "Ramky On North",
          icon: AppIcon.address,
          onTap: () {},
        ),
        FieldSetting(
          title: "king@gmail.com",
          icon: AppIcon.email,
          onTap: () {},
        ),
        FieldSetting(
          title: "+967715656452",
          icon: AppIcon.phone,
          onTap: () {},
        ),
        FieldSetting(
          title: "******",
          icon: AppIcon.closePassword,
          onTap: () {},
        ),
        SizedBox(height: 50),
        FieldSetting(
          title: KeyLanguage.logout,
          icon: AppIcon.logout,
          onTap: () {},
        ),
      ],
    );
  }
}
