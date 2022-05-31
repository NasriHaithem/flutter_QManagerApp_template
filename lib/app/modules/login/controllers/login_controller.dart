import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:mobile_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:mobile_app/app/modules/register/bindings/register_binding.dart';
import 'package:mobile_app/app/modules/register/views/register_view.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }

  void navigateToRegister() {
    Get.off(() => RegisterView(), binding: RegisterBinding());
  }

  void navigateToForgotPassword() {
    Get.to(() => ForgotPasswordView(), binding: ForgotPasswordBinding());
  }
}
