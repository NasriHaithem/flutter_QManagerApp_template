import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/bindings/share_location_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/views/share_location_view.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/bindings/sites_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/views/sites_view.dart';
import 'package:mobile_app/global_state_management.dart';

class FavoritesController extends GetxController {

  void navigateToNextPage() {
    final Rx<Position>? position = GlobalState.globalState.userPosition;
    if( position == null) {
      Get.to(
              () => ShareLocationView(),
          binding: ShareLocationBinding(),
          arguments: {
            "organisation": "organisation",
            "service": "service",
          },
          transition: Transition.rightToLeft
      );
    }
    else {
      Get.to(
              () => SitesView(),
          binding: SitesBinding(),
          arguments: {
            "organisation": "organisation",
            "service": "pickedService",
            "isLocationEnabled": true,
            "latitude": position.value.latitude,
            "longitude": position.value.longitude
          },
          transition: Transition.rightToLeft
      );

    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
