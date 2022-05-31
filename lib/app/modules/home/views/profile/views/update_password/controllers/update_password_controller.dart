import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/utils/credentials_validator.dart';

class UpdatePasswordController extends GetxController {
  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();
  late TextEditingController repeatPasswordController, passwordController;

  var repeatPassword = '';
  var password = '';
  var isVisibleInput1 = false.obs;
  var isVisibleInput2 = false.obs;

  @override
  void onInit() {
    super.onInit();
    repeatPasswordController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    repeatPasswordController.dispose();
    passwordController.dispose();
  }

  void checkPassword() {

    final isValid =
        updatePasswordFormKey.currentState!.validate() ;
    if (!isValid) {
      return;
    }
    updatePasswordFormKey.currentState!.save();
    Get.back();
  }

  void navigateBack() {
    Get.back();
  }

}
