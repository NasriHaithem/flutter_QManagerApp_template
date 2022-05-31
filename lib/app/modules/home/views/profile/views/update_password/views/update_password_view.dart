import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/utils/credentials_validator.dart';

import '../controllers/update_password_controller.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.deepPurpleAccent,
            size: 35,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.updatePasswordFormKey,
              child: Column(
                children: [
                 Text(
                    "updatePasswordTitle".tr,
                    style: const TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  const SizedBox(height: 30,),

                  //Password
                  Obx(
                        () => TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            controller.isVisibleInput1.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of isVisibleInput1 variable
                            controller.isVisibleInput1.value = !controller.isVisibleInput1.value;
                          },
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "newPasswordInputLabel".tr,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isVisibleInput1.value,
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
                              controller.isVisibleInput2.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of isVisibleInput2 variable
                              controller.isVisibleInput2.value = !controller.isVisibleInput2.value;
                            },
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "repeatedPasswordInputLabel".tr,
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.isVisibleInput2.value,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
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
                        const SizedBox(width: 9,),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent[100]),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                            fixedSize: MaterialStateProperty.all(const Size(160, 47) ),

                          ),
                          child: Text(
                            "cancel".tr,
                            style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            controller.navigateBack();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
