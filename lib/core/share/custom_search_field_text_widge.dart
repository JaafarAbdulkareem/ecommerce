import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchFieldTextWidge extends StatelessWidget {
  const CustomSearchFieldTextWidge({
    super.key,
    this.autofocus = false,
  });

  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.find<SearchProductControllerImp>();

    return TextFormField(
      controller: controller.textController,
      autofocus: autofocus,
      onFieldSubmitted: (value) => controller.onSearch(),
      onChanged: controller.onChange,
      style: theme.textTheme.titleSmall,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: IconButton(
          onPressed: controller.onSearch,
          icon: Icon(
            AppIcon.search,
            size: 20,
            color: theme.iconTheme.color,
          ),
        ),
        hintText: KeyLanguage.searchHint.tr,
        hintStyle: theme.textTheme.bodyMedium, 
        border: _border(theme),
        enabledBorder: _border(theme),
        focusedBorder: _border(theme),
      ),
    );
  }

  OutlineInputBorder _border(ThemeData theme) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: theme.colorScheme.primary),
    );
  }
}
