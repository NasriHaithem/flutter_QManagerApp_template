import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  var email = '';

  @override
    void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
    void onReady() {
    super.onReady();
  }

  @override
    void onClose() {
    emailController.dispose();
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }
}
