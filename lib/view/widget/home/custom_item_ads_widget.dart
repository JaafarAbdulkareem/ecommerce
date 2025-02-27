import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/data/models/ads_home_model.dart';
import 'package:flutter/material.dart';

class CustomItemAdsWidget extends StatelessWidget {
  const CustomItemAdsWidget({
    super.key,
    required this.data,
  });
  final AdsHomeModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(data.background),
      child: Stack(
        children: [
          Center(
            child: ListTile(
              title: Text(
                data.name,
                style: AppStyle.styleLight16(context)
                    .copyWith(color: Color(data.ballColor)),
              ),
              subtitle: Text(
                data.desc,
                style: AppStyle.styleBold18(context)
                    .copyWith(color: Color(data.ballColor)),
              ),
            ),
          ),
          Positioned(
            top: -8,
            right: -25,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(data.ballColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
