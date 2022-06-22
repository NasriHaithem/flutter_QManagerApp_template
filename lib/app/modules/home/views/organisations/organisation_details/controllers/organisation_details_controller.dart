import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/models/Organisation.dart';
import 'package:mobile_app/app/models/Service.dart';
import 'package:mobile_app/app/models/Service.dart';
import 'package:mobile_app/app/models/Service.dart';
import 'package:mobile_app/app/models/Service.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/bindings/share_location_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/views/share_location_view.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/bindings/sites_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/views/sites_view.dart';
import 'package:mobile_app/app/services/serviceService.dart';
import 'package:mobile_app/global_state_management.dart';

class OrganisationDetailsController extends GetxController {
  final pageController = PageController(initialPage: 0);
  late final List<Service> allServices;
  Rx<List<Service>> foundServices = Rx<List<Service>>([]);
  final searchInput = TextEditingController();

  late final Organisation organisation;

  @override
  void onInit() async{
    organisation = Get.arguments;
    allServices = await getServicesByOrganisationName(organisation.name);
    print("services: ${allServices[1].toJson()}" );
    foundServices.value = allServices;
    super.onInit();
  }

  Future<List<Service>> getServicesByOrganisationName(String orgName) async{
    var response = await ServiceService.getServicesByOrganisationName(organisation.name);
    final List<dynamic> responseJson = jsonDecode(response.body);

    return responseJson
        .map((c) => Service.fromJson(c))
        .toList();
  }




  void filterServices(String nomService) {
    List<Service> results = [];
    if (nomService.isEmpty) {
      results = allServices;
    } else {
      results = allServices
          .where((s) => s.name
          .toString()
          .toLowerCase()
          .contains(nomService.toLowerCase()))
          .toList();
    }
    foundServices.value = results;
  }

  void navigateToNextPage(service) {
    final Rx<Position>? position = GlobalState.globalState.userPosition;
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
            "latitude": position.value.latitude,
            "longitude": position.value.longitude
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
