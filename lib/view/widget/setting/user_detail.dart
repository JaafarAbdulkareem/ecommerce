import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/setting/field_setting.dart';
import 'package:ecommerce/view/widget/setting/theme_theme_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetail extends GetView<SettingControllerImp> {
  const UserDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FieldSetting(
          title: controller.userData.username,
          icon: AppIcon.username,
          onTap: () {},
        ),
        GetBuilder<SettingControllerImp>(
            id: ConstantKey.idUpdateAddress,
            builder: (controller) {
              return controller.userData.address.isNotEmpty
                  ? FieldSetting(
                      title: controller.userData.address.first.city,
                      icon: AppIcon.address,
                      onTap: () {
                        controller.goToDisplayAddress();
                      },
                    )
                  : FieldSetting(
                      title: KeyLanguage.addressSetting.tr,
                      icon: AppIcon.address,
                      onTap: () {
                        controller.goToInserAddress();
                      },
                    );
            }),
        FieldSetting(
          title: KeyLanguage.archiveTitle.tr,
          icon: AppIcon.archive,
          onTap: () {
            controller.goToArchive();
          },
        ),
        FieldSetting(
          title: controller.userData.email,
          icon: AppIcon.email,
          onTap: () {},
        ),
        FieldSetting(
          title: controller.userData.phone.toString(),
          icon: AppIcon.phone,
          onTap: () {},
        ),
        FieldSetting(
          title: ConstantText.obscureText * ConstantScale.settingNoPassword,
          icon: AppIcon.closePassword,
          onTap: () {},
        ),
        const ThemeModeSettings(),
        const SizedBox(height: 50),
        FieldSetting(
          title: KeyLanguage.contectUsTitle.tr,
          icon: AppIcon.contactUs,
          onTap: () {
            controller.contactUs();
          },
        ),
        FieldSetting(
          title: KeyLanguage.logout.tr,
          icon: AppIcon.logout,
          onTap: () {
            controller.logout();
          },
        ),
      ],
    );
  }
}
