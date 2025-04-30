import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class BodyDisplayAddressView extends StatelessWidget {
  const BodyDisplayAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        //update
        itemCount: 5,
        itemBuilder: (context, index) => SizedBox(
          height: 130,
          child: Card(
            color: AppColor.card,
            child: Center(
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 12),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    AppIcon.delete,
                  ),
                ),
                title: Text(
                  "234 Oak Street, Anytown, CA 91234, USA",
                  style: AppStyle.styleSemiBold14(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
                subtitle: Text(
                  " 44/1 Bharat Apartment 4C 5th Main Road, Jayanagar, Bangalore 560041, KA, IND Smarty, a provider of address formatting. These formats include a street number and name, city, state/province/region, and zip/postal",
                  style: AppStyle.styleLight14(context),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
