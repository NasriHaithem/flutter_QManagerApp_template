import 'package:get/get.dart';

import '../controllers/organisations_list_controller.dart';

class OrganisationsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrganisationsListController>(
      () => OrganisationsListController(),
    );
  }
}
