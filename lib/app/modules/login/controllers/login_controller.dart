import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/dto/authRequest.dart';
import 'package:mobile_app/app/dto/authResponse.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/models/AppUser.dart';
import 'package:mobile_app/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:mobile_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:mobile_app/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_app/app/modules/home/views/home_view.dart';
import 'package:mobile_app/app/modules/on_boarding/bindings/on_boarding_binding.dart';
import 'package:mobile_app/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:mobile_app/app/modules/register/bindings/register_binding.dart';
import 'package:mobile_app/app/modules/register/views/register_view.dart';
import 'package:mobile_app/app/services/userService.dart';
import 'package:mobile_app/app/widgets/ErrorMsgWidget.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';
  bool showOnBoarding = false;
  var errorMsg = "".obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    showOnBoarding = Get.arguments != null ? Get.arguments["showOnBoarding"] : false ;
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

  void checkLogin() async {
    errorMsg.value = "";
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();

    var loginResponse = await UserService.login(
      AuthRequest(username: email, password: password)
    );

    print(loginResponse.statusCode);
    if(loginResponse.statusCode != 200) {
      errorMsg.value = "Incorrect username or password";
      return;
    }

    //Reset error message
    errorMsg.value = "";

    //Decode the JSON result to a map.
    final Map<String, dynamic> jsonResult = jsonDecode(loginResponse.body);
    //Convert map to AuthResponse.
    AuthResponse authResponse = AuthResponse.fromJson(jsonResult);

    await StorageHandler.storeToken(authResponse.jwt);
    await StorageHandler.storeUser(authResponse.user);

    //If 1st time logging in, navigate to On-boarding before Home
    showOnBoarding ? navigateToOnBoarding() : navigateToHome();

  }

  Widget displayErrorMsg() {
    if (errorMsg.value == "" ) return Container();
    return ErrorMsgWidget(errorMsg: errorMsg.value);
  }

  void navigateToRegister() {
    Get.off(() => RegisterView(), binding: RegisterBinding());
  }

  void navigateToForgotPassword() {
    Get.to(() => ForgotPasswordView(), binding: ForgotPasswordBinding());
  }

  void navigateToHome() {
    Get.offAll(() => HomeView(), binding: HomeBinding());
  }

  void navigateToOnBoarding() {
    Get.offAll(() => OnBoardingView(), binding: OnBoardingBinding());
  }
}
