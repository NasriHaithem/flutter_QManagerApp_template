import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/widgets/dialogs/choose_language_dialog.dart';

import 'package:mobile_app/app/utils/credentials_validator.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.registerFormKey,
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
                    height: 8,
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
                    height: 8,
                  ),

                  //Firstname
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "firstnameInputLabel".tr,
                      prefixIcon: const Icon(Icons.edit),
                    ),
                    controller: controller.firstnameController,
                    onSaved: (value) {
                      controller.firstname = value!;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  //Lastname
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "lastnameInputLabel".tr,
                      prefixIcon: const Icon(Icons.edit),
                    ),
                    controller: controller.lastnameController,
                    onSaved: (value) {
                      controller.lastname = value!;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  //Phone
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "phoneInputLabel".tr,
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                    onSaved: (value) {
                      controller.phone = value!;
                    },
                    validator: (value) {
                      return CredentialsValidator.validatePhone(value!);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),

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
                        "registerBtn".tr,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        controller.checkRegister();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Center(
                    child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'hasAccountTxt'.tr,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'loginBtn'.tr,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 17.0
                          ),
                          recognizer: TapGestureRecognizer()..onTap = ()
                            {
                              controller.navigateToLogin();
                            }
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
