import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class FieldSetting extends StatelessWidget {
  const FieldSetting({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.card,
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        trailing: Icon(icon),
      ),
    );
  }
}
