import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/services/serviceService.dart';

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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
