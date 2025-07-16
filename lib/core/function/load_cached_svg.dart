import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';

Future<Widget> loadCachedSvg(
  String imageUrl, {
  required Color color,
}) async {
  final file = await DefaultCacheManager().getSingleFile(imageUrl);

  return SvgPicture.file(
    file,
    colorFilter: ColorFilter.mode(
      color,
      BlendMode.srcIn,
    ),
    fit: BoxFit.fill,
    width: ConstantScale.sizeCategoryIcon,
  );
}
