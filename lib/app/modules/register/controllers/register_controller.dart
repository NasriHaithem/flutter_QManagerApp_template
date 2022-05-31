import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/login/bindings/login_binding.dart';
import 'package:mobile_app/app/modules/login/views/login_view.dart';
import 'package:mobile_app/app/modules/on_boarding/bindings/on_boarding_binding.dart';
import 'package:mobile_app/app/modules/on_boarding/views/on_boarding_view.dart';
import '../../../utils/credentials_validator.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController  emailController,
                              passwordController,
                              firstnameController,
                              lastnameController,
                              phoneController;

  var email = '';
  var password = '';
  var firstname = '';
  var lastname = '';
  var phone = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
  }

  void checkRegister() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();
    Get.offAll(() => OnBoardingView(), binding: OnBoardingBinding());
  }

  void navigateToLogin() {
    Get.off(() => LoginView(), binding: LoginBinding());
  }
}
