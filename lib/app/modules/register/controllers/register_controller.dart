import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/login/bindings/login_binding.dart';
import 'package:mobile_app/app/modules/login/views/login_view.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  final pageController = PageController(initialPage: 0);

  late TextEditingController  emailController,
                              passwordController,
                              repeatPasswordController,
                              firstnameController,
                              lastnameController,
                              phoneController,
                              codeController;

  var email = '';
  var firstname = '';
  var lastname = '';
  var phone = '';

  var code = '';

  var password = '';
  var repeatPassword = '';
  var isObscureInput1 = true.obs;
  var isObscureInput2 = true.obs;

  var stepCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    firstnameController = TextEditingController();
    lastnameController = TextEditingController();
    phoneController = TextEditingController();

    codeController = TextEditingController();

    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();

  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    emailController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();

    codeController.dispose();

    passwordController.dispose();
    repeatPasswordController.dispose();
  }

  void checkRegister() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();
    stepCount++;
    pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
    );


  }

  void checkCode() {
    final isValid = confirmCodeFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    confirmCodeFormKey.currentState!.save();
    pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease
    );
    stepCount++;
  }

  void checkPassword() {
    final isValid = passwordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    passwordFormKey.currentState!.save();
  }

  void navigateToLogin() {
    Get.off(() => LoginView(), binding: LoginBinding());
  }
}
