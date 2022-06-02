import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/bindings/share_location_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/views/share_location_view.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/bindings/sites_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/views/sites_view.dart';
import 'package:mobile_app/app/services/serviceService.dart';
import 'package:mobile_app/global_state_management.dart';

class OrganisationDetailsController extends GetxController {
  final pageController = PageController(initialPage: 0);
  late final List<Map<String, dynamic>> allServices;
  Rx<List<Map<String, dynamic>>> foundServices = Rx<List<Map<String, dynamic>>>([]);
  final searchInput = TextEditingController();

  late final dynamic organisation;

  @override
  void onInit() {
    organisation = Get.arguments;
    allServices = ServiceService.servicesList;
    foundServices.value = allServices;
    super.onInit();
  }

  void filterServices(String nomService) {
    List<Map<String, dynamic>> results = [];
    if (nomService.isEmpty) {
      results = allServices;
    } else {
      results = allServices
          .where((element) => ServiceService.getServiceName(element)
          .toString()
          .toLowerCase()
          .contains(nomService.toLowerCase()))
          .toList();
    }
    foundServices.value = results;
  }

  void navigateToNextPage(service) {
    final position = GlobalState.globalState.userPosition;
    if( position == null) {
      Get.to(
          () => ShareLocationView(),
          binding: ShareLocationBinding(),
          arguments: {
            "organisation": organisation,
            "service": service,
          },
          transition: Transition.rightToLeft
      );
    }
    else {
      Get.to(
          () => SitesView(),
          binding: SitesBinding(),
          arguments: {
            "organisation": organisation,
            "service": service,
            "isLocationEnabled": true,
            "position": position
          },
          transition: Transition.rightToLeft
      );

    }
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
