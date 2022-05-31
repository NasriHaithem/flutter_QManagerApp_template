import 'package:get/get.dart';

import '../controllers/account_credentials_controller.dart';

class AccountCredentialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountCredentialsController>(
      () => AccountCredentialsController(),
    );
  }
}
