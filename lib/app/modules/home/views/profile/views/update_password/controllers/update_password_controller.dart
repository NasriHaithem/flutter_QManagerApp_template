import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/models/AppUser.dart';
import 'package:mobile_app/app/modules/login/bindings/login_binding.dart';
import 'package:mobile_app/app/modules/login/views/login_view.dart';
import 'package:mobile_app/app/services/userService.dart';
import 'package:mobile_app/app/utils/credentials_validator.dart';
import 'package:mobile_app/app/widgets/ErrorMsgWidget.dart';

class UpdatePasswordController extends GetxController {
  final GlobalKey<FormState> updateRequestFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController codeController;
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;

  final pageController = PageController(initialPage: 0);

  //1ST Form inputs
  var email = '';
  //2ND Form inputs
  var code = '';
  //3RD Form inputs
  var password = '';
  var repeatPassword = '';
  var isObscureInput1 = true.obs;
  var isObscureInput2 = true.obs;
  //Stepper counter
  var stepCount = 0.obs;
  //Email request error msg
  var emailErrorMsg = "".obs;
  //Code  error msg
  var codeErrorMsg = "".obs;
  //Random Confirmation Code
  var randomCode = "";

  late AppUser? userFound;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
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
    codeController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
  }


  void checkRequest() async {
    emailErrorMsg.value = "";
    final isValid = updateRequestFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    updateRequestFormKey.currentState!.save();

    userFound = await StorageHandler.getUserFromStorage();

    if (userFound!.mail != email) {
      emailErrorMsg.value = "Wrong Email";
      return;
    }
    emailErrorMsg.value = "";

    //If no errors, Send activation Email to user
    randomCode = Random().nextInt(999999).toString() ;
    UserService.sendActivationCodeToEmail(userFound!.telephone, randomCode);

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
    final isValid = updatePasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    updatePasswordFormKey.currentState!.save();
    userFound!.password = password;
    UserService.resetPassword(userFound!.telephone, userFound!);

    navigateToProfile();
  }

  void navigateToProfile() {
    Get.back();
  }

  Widget displayCodeErrorMsg() {
    if (codeErrorMsg.value == "" ) return Container();
    return ErrorMsgWidget(errorMsg: codeErrorMsg.value);
  }

  Widget displayEmailErrorMsg() {
    if (emailErrorMsg.value == "" ) return Container();
    return ErrorMsgWidget(errorMsg: emailErrorMsg.value);
  }

}
