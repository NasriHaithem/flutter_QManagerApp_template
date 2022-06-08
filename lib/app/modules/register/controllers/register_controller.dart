import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/models/AppUser.dart';
import 'package:mobile_app/app/modules/login/bindings/login_binding.dart';
import 'package:mobile_app/app/modules/login/views/login_view.dart';
import 'package:mobile_app/app/modules/on_boarding/bindings/on_boarding_binding.dart';
import 'package:mobile_app/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:mobile_app/app/services/userService.dart';
import 'package:mobile_app/app/widgets/ErrorMsgWidget.dart';

class RegisterController extends GetxController {
  //Forms keys
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  //Pageviews Controller
  final pageController = PageController(initialPage: 0);

  //Inputs Controllers
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  late TextEditingController firstnameController;
  late TextEditingController lastnameController;
  late TextEditingController phoneController;
  late TextEditingController codeController;

  //1ST Form inputs
  var email = '';
  var firstname = '';
  var lastname = '';
  var phone = '';
  //2ND Form inputs
  var code = '';
  //3RD Form inputs
  var password = '';
  var repeatPassword = '';
  var isObscureInput1 = true.obs;
  var isObscureInput2 = true.obs;
  //Stepper counter
  var stepCount = 0.obs;
  //1ST Form error msg
  var registerErrorMsg = "".obs;
  //2ND Form error msg
  var codeErrorMsg = "".obs;
  //Random Confirmation Code
  var randomCode = "";

  RxString dialCodeInitial = '+216'.obs;

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

  void checkRegister() async {
    registerErrorMsg.value = "";
    //check if inputs are valid
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();

    //Register API
    var result = await UserService.register(
      AppUser(
        nom: firstname,
        prenom: lastname,
        mail: email,
        password: password,
        telephone: phone,
      )
    );
    //If Error, Display error message and stop method.
    if(result.statusCode != 200) {
      registerErrorMsg.value = "Email or Phone number is already in use";
      return;
    }
    registerErrorMsg.value = "";
    //If no errors, Send activation Email to user
    randomCode = Random().nextInt(999999).toString() ;
    UserService.sendActivationCodeToEmail(phone, randomCode);

    registerErrorMsg.value = "";
    stepCount++;
    pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
    );
  }

  void checkCode() {
    codeErrorMsg.value = "";
    final isValid = confirmCodeFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    confirmCodeFormKey.currentState!.save();

    print(code);
    print(randomCode);

    if(code != randomCode) {
      codeErrorMsg.value = "Wrong code";
      return;
    }
    codeErrorMsg.value = "";
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

    UserService.activateAccount(
        phone,
        AppUser(nom: "nom", prenom: "prenom", mail: "mail", password: password, telephone: "telephone")
    );

    loginWithNewAccount();
  }

  void navigateToLogin() {
    Get.off(() => LoginView(), binding: LoginBinding());
  }

  void loginWithNewAccount() {
    Get.off(
            () => LoginView(),
        binding: LoginBinding(),
        arguments: { "showOnBoarding": true }
    );
  }

  Widget displayRegisterErrorMsg() {
    if (registerErrorMsg.value == "" ) return Container();
    return ErrorMsgWidget(errorMsg: registerErrorMsg.value);
  }

  Widget displayCodeErrorMsg() {
    if (codeErrorMsg.value == "" ) return Container();
    return ErrorMsgWidget(errorMsg: codeErrorMsg.value);
  }
}
