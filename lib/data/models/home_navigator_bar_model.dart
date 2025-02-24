import 'package:flutter/widgets.dart';

class HomeNavigatorBarModel {
  final IconData icon;
  final String title;
  final Widget screen;

  const HomeNavigatorBarModel({
    required this.icon,
    required this.title,
    required this.screen,
  });
}
