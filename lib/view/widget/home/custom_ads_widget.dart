import 'package:ecommerce/core/animation/infinite_carousel_widget.dart';
import 'package:ecommerce/data/models/ads_home_model.dart';
import 'package:ecommerce/view/widget/home/custom_item_ads_widget.dart';
import 'package:flutter/widgets.dart';

class CustomAdsWidget extends StatelessWidget {
  const CustomAdsWidget({super.key});
  //remove
  static List<AdsHomeModel> data = const [
    AdsHomeModel(
      name: "Offer1",
      desc: "Discount 50%",
      background: 0xFF000000,
      ballColor: 0xFFFFFFFF,
    ),
    AdsHomeModel(
      name: "Offer2",
      desc: "Discount 50%",
      background: 0xFF000000,
      ballColor: 0xFFFFFFFF,
    ),
    AdsHomeModel(
      name: "Offer3",
      desc: "Discount 50%",
      background: 0xFF000000,
      ballColor: 0xFFFFFFFF,
    ),
    AdsHomeModel(
      name: "Offer4",
      desc: "Discount 50%",
      background: 0xFF000000,
      ballColor: 0xFFFFFFFF,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return InfiniteCarouselWidget<AdsHomeModel>(
      items: data,
      itemBuilder: (e) => SizedBox(
        height: 150,
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: CustomItemAdsWidget(data: e),
        ),
      ),
    );
  }
}
