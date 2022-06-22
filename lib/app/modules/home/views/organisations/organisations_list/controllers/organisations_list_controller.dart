import 'package:get/get.dart';
import 'package:mobile_app/app/models/Organisation.dart';

class OrganisationsListController extends GetxController {

  late final List<Organisation> allOrganisations;
  Rx<List<Organisation>> foundOrganisations = Rx<List<Organisation>>([]);


  @override
  void onInit() {
    super.onInit();
    allOrganisations = Get.arguments;
    print(allOrganisations[0].logo);
    foundOrganisations.value = allOrganisations;
  }
  void filterOrganisations(String nomOrganisation) {
    List<Organisation> results = [];
    if (nomOrganisation.isEmpty) {
      results = allOrganisations;
    } else {
      results = allOrganisations
          .where((org) => org.name
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
