import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/login/controllers/login_controller.dart';
import 'package:mobile_app/app/utils/credentials_validator.dart';
import 'package:mobile_app/app/widgets/dialogs/choose_language_dialog.dart';


class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "loginPageTitle".tr,
                        style: const TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                      TextButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => LanguageDialog(),
                        ),
                        child: Row(
                          children: [
                            Text('updateLanguage'.tr),
                            const SizedBox(width: 3),
                            const Icon(Icons.language)
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Error message
                  Obx(
                      () => controller.displayErrorMsg()
                  ),
                  //Email
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "emailInputLabel".tr,
                      prefixIcon: const Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return CredentialsValidator.validateEmail(value!);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //Password
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "passwordInputLabel".tr,
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: controller.passwordController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return CredentialsValidator.validatePassword(value!);
                    },
                  ),
                  const SizedBox(
                    height: 9,
                  ),

                  //Forgot Password
                  Center(
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'forgotPasswordBtn'.tr,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.0
                                ),
                                recognizer: TapGestureRecognizer()..onTap = ()
                                {
                                  controller.navigateToForgotPassword();
                                }
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //Login
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurpleAccent),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                      ),
                      child: Text(
                        "loginBtn".tr,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        controller.checkLogin();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //Doesn't have an account
                  Center(
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: "noAccountTxt".tr,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                                text: 'registerBtn'.tr,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17.0
                                ),
                                recognizer: TapGestureRecognizer()..onTap = ()
                                {
                                  controller.navigateToRegister();
                                }
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
