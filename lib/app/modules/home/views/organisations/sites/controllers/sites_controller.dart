import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/models/Organisation.dart';
import 'package:mobile_app/app/models/Service.dart';
import 'package:mobile_app/app/models/Site.dart';
import 'package:mobile_app/app/models/Ticket.dart';
import 'package:mobile_app/app/services/TicketService.dart';
import 'package:mobile_app/app/services/siteService.dart';

class SitesController extends GetxController {
  late final List<Site> allSites;
  Rx<List<Site>> foundSites = Rx<List<Site>>([]);
  final searchInput = TextEditingController();
  var filterValue = "closest".obs;
  RxBool isLoading = true.obs ;

  //User Position
  late final double latitude;
  late final double longitude;
  //Picked Location, Organisation & Service
  late final String pickedGovernorate;
  late final String pickedDelegation;
  late final Service service;
  late final Organisation organisation;

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
  void onInit() async{
    service = Get.arguments['service'];
    organisation = Get.arguments['organisation'];

    //If the user provided his GPS coordinates.
    if(Get.arguments['isLocationEnabled'] == true) {
      latitude = Get.arguments['latitude'];
      longitude = Get.arguments['longitude'];
      allSites = await getSitesByOrgAndServiceAndGpsCoordinates( organisation.name, service.id, latitude, longitude );
    }
    //If the user picked closest address instead.
    else {
      pickedGovernorate = Get.arguments["governorate"];
      pickedDelegation = Get.arguments["delegation"];
      allSites = await getSitesByOrgAndServiceAndAddress( organisation.name, service.id, pickedGovernorate, pickedDelegation );
    }
    foundSites.value = allSites;
    isLoading.value = false;
    super.onInit();
  }

  void filterSites(String nomSite) {
    List<Site> results = [];
    if (nomSite.isEmpty) {
      results = allSites;
    } else {
      results = allSites
          .where((site) => site.name
          .toString()
          .toLowerCase()
          .contains(nomSite.toLowerCase()))
          .toList();
    }
    foundSites.value = results;
  }

  Future<List<Site>> getSitesByOrgAndServiceAndAddress(String orgName, int serviceId, String gov, String delegation) async{
    var response = await SiteService.getSitesByOrgAndServiceAndAddress(orgName, serviceId, gov, delegation);
    final List<dynamic> responseJson = jsonDecode(response.body);
    return responseJson
        .map((c) => Site.fromJson(c))
        .toList();
  }

  Future<List<Site>> getSitesByOrgAndServiceAndGpsCoordinates(String orgName, int serviceId, double latitude, double longitude) async{
    var response = await SiteService.getSitesByOrgAndServiceAndGpsCoordinates(orgName, serviceId, latitude, longitude);
    print(jsonDecode(response.body));
    final List<dynamic> responseJson = jsonDecode(response.body);
    return responseJson
        .map((c) => Site.fromJson(c))
        .toList();
  }

  Future<Ticket> getTicket(int siteId, Service service) async{
    String userId = (await StorageHandler.getUserFromStorage())!.telephone;
    var response = await TicketService.reserveTicket(siteId, userId, service);
    print(jsonDecode(response.body));
    final dynamic responseJson = jsonDecode(response.body);
    return Ticket.fromJson(responseJson);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
