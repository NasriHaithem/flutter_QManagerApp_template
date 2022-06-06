import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/services/siteService.dart';

class SitesController extends GetxController {
  late final List<Map<String, dynamic>> allSites;
  Rx<List<Map<String, dynamic>>> foundSites = Rx<List<Map<String, dynamic>>>([]);
  final searchInput = TextEditingController();

  late final dynamic service;
  late final dynamic organisation;
  var filterValue = "closest".obs;
  List<DropdownMenuItem<String>>? filterItems = const [
      DropdownMenuItem(
        value: "closest",
        child: Text("Closest sites", style: TextStyle(color: Colors.white),),
      ),
      DropdownMenuItem(
      value: "less",
      child: Text("Less traffic", style: TextStyle(color: Colors.white),),
    ),
  ];
  @override
  void onInit() {
    service = Get.arguments['service'];
    organisation = Get.arguments['organisation'];
    allSites = SiteService.sitesList;
    foundSites.value = allSites;
    super.onInit();
  }

  void filterSites(String nomSite) {
    List<Map<String, dynamic>> results = [];
    if (nomSite.isEmpty) {
      results = allSites;
    } else {
      results = allSites
          .where((element) => SiteService.getSiteName(element)
          .toString()
          .toLowerCase()
          .contains(nomSite.toLowerCase()))
          .toList();
    }
    foundSites.value = results;
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
