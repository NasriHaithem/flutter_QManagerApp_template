import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/services/organisationService.dart';

class OrganisationsListController extends GetxController {

  late final List<Map<String, dynamic>> allOrganisations;
  Rx<List<Map<String, dynamic>>> foundOrganisations = Rx<List<Map<String, dynamic>>>([]);


  @override
  void onInit() {
    super.onInit();
    allOrganisations = OrganisationService.organisationList;
    foundOrganisations.value = allOrganisations;
  }
  void filterOrganisations(String nomOrganisation) {
    List<Map<String, dynamic>> results = [];
    if (nomOrganisation.isEmpty) {
      results = allOrganisations;
    } else {
      results = allOrganisations
          .where((element) => OrganisationService.getOrganisationName(element)
          .toString()
          .toLowerCase()
          .contains(nomOrganisation.toLowerCase()))
          .toList();
    }
    foundOrganisations.value = results;
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
