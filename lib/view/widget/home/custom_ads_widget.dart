import 'package:ecommerce/data/models/ads_home_model.dart';
import 'package:ecommerce/view/widget/home/custom_item_ads_widget.dart';
import 'package:flutter/widgets.dart';

class CustomAdsWidget extends StatelessWidget {
  const CustomAdsWidget({super.key});
  //remove
  static List<AdsHomeModel> data = const [
    AdsHomeModel(
      name: "Offer",
      desc: "Discount 50%",
      background: 0xFF000000,
      ballColor: 0xFFFFFFFF,
    ),
    AdsHomeModel(
      name: "Offer",
      desc: "Discount 50%",
      background: 0xFF000000,
      ballColor: 0xFFFFFFFF,
    ),
    AdsHomeModel(
      name: "Offer",
      desc: "Discount 50%",
      background: 0xFF000000,
      ballColor: 0xFFFFFFFF,
    ),
    AdsHomeModel(
      name: "Offer",
      desc: "Discount 50%",
      background: 0xFF000000,
      ballColor: 0xFFFFFFFF,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: data
              .map(
                (e) => AspectRatio(
                  aspectRatio: 2 / 1,
                  child: CustomItemAdsWidget(data: e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
