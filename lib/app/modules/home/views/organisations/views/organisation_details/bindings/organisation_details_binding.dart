import 'package:get/get.dart';

import '../controllers/organisation_details_controller.dart';

class OrganisationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrganisationDetailsController>(
      () => OrganisationDetailsController(),
    );
  }
}
