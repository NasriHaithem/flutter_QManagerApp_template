import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/utils/credentials_validator.dart';
import 'package:mobile_app/app/widgets/dialogs/choose_language_dialog.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.deepPurple,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //LOGO
                Image.asset(
                  "assets/logo.png",
                ),
                const SizedBox(
                  height: 20,
                ),

                //STEPPER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: const Center(
                            child: Text('1', style: TextStyle(color: Colors.white, fontSize: 12),),
                          ),
                        ),
                        Text('resetPasswordStepLabel'.tr, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )
                      ),
                    ),

                    Obx(
                      () => Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: controller.stepCount < 1
                                    ? Colors.grey.shade400
                                    : Colors.deepPurpleAccent,

                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Center(
                              child: Text('2', style: TextStyle(color: Colors.white, fontSize: 12),),
                            ),
                          ),
                          Text('verifyCodeStepLabel'.tr, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Expanded(
                      child:  Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                          )
                      ),
                    ),

                    Obx(
                          () => Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: controller.stepCount.value == 2
                                    ? Colors.deepPurpleAccent
                                    : Colors.grey.shade400,

                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Center(
                              child: Text('3', style: TextStyle(color: Colors.white, fontSize: 12),),
                            ),
                          ),
                          Text('confirmStepLabel'.tr, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 500,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    children: [
                      SingleChildScrollView(
                        child: Form(
                          key: controller.resetRequestFormKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "forgotPasswordTitle".tr,
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
                              //ERROR MESSAGE
                              Obx(
                                  () => controller.displayEmailErrorMsg()
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

                              //Send Email
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
                                    "submit".tr,
                                    style: const TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    controller.checkRequest();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Form(
                          key: controller.verifycodeFormKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "confirmCodePageTitle".tr,
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
                                height: 20,
                              ),
                              //ERROR MESSAGE
                              Obx(
                                      () => controller.displayCodeErrorMsg()
                              ),
                              //CODE
                              TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: "codeInputLabel".tr,
                                  prefixIcon: const Icon(CupertinoIcons.number),
                                ),
                                keyboardType: TextInputType.number,
                                controller: controller.codeController,
                                onSaved: (value) {
                                  controller.code = value!;
                                },
                                validator: (value) {
                                  return CredentialsValidator.validateRequiredInput(value!);
                                },
                              ),
                              const SizedBox(
                                height: 20,
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
                                    "confirmBtn".tr,
                                    style: const TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    controller.checkCode();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Form(
                          key: controller.newPasswordFormKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "createPasswordStepLabel".tr,
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
                                height: 20,
                              ),

                              //Password
                              Obx(
                                    () => TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        controller.isObscureInput1.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of isObscureInput1 variable
                                        controller.isObscureInput1.value = !controller.isObscureInput1.value;
                                      },
                                    ),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: "newPasswordInputLabel".tr,
                                    prefixIcon: const Icon(Icons.lock),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: controller.isObscureInput1.value,
                                  controller: controller.passwordController,
                                  onSaved: (value) {
                                    controller.password = value!;
                                  },
                                  validator: (value) {
                                    return CredentialsValidator.validatePassword(value!);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),

                              //Repeated Password
                              Obx(
                                    () => TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        controller.isObscureInput2.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of isObscureInput2 variable
                                        controller.isObscureInput2.value = !controller.isObscureInput2.value;
                                      },
                                    ),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: "repeatedPasswordInputLabel".tr,
                                    prefixIcon: const Icon(Icons.lock),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: controller.isObscureInput2.value,
                                  controller: controller.repeatPasswordController,
                                  onSaved: (value) {
                                    controller.repeatPassword = value!;
                                  },
                                  validator: (value) {

                                    return CredentialsValidator.validateRepeatedPassword(value!, controller.passwordController.text);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
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
                                    backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                                    padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                                    fixedSize: MaterialStateProperty.all(const Size(160, 47) ),
                                  ),
                                  child: Text(
                                    "save".tr,
                                    style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    controller.checkPassword();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          )
        ),
      ),
    );
  }
}
