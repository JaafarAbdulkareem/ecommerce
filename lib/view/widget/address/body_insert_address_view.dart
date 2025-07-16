import 'package:ecommerce/controller/address/insert_address_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BodyInsertAddressView extends GetView<InsertAddressControllerImp> {
  const BodyInsertAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
      () {
        return Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              markers: controller.markers.toSet(),
              onMapCreated: (initController) async {
                controller.googleMapController = initController;
                await controller.getUserLocation();
              },
              onTap: controller.changeuserLocation,
              initialCameraPosition: controller.initialCameraPosition,
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: controller.enableButton.value
                  ? CustomButtonWidget(
                      text: KeyLanguage.nextButton.tr,
                      onTap: controller.goToDetailInsertAddress,
                    )
                  : Text(
                      KeyLanguage.waitingGoogleMap.tr,
                      style: theme.textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        );
      },
    );
  }
}
