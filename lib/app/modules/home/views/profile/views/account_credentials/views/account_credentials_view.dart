import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/utils/location_utils.dart';

import '../controllers/account_credentials_controller.dart';

class AccountCredentialsView extends GetView<AccountCredentialsController> {
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
      body:  Obx( () => controller.isLoading.value
            ? const SpinKitSquareCircle(
              color: Colors.deepPurple,
              size: 50.0,
            )
            : Padding(
                padding:  const EdgeInsets.all(20.0),
                child:  Column(
                  children:  <Widget>[
                    Card(
                      child: ListTile(
                        horizontalTitleGap: 50,
                        leading:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Text(
                            "firstnameInputLabel".tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),

                          ),
                        ),
                        trailing: Text(
                          controller.currentUser!.nom,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    Card(
                      child: ListTile(
                        horizontalTitleGap: 50,
                        leading:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Text(
                            "lastnameInputLabel".tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),

                          ),
                        ),
                        trailing: Text(
                          controller.currentUser!.prenom,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    Card(
                      child: ListTile(
                        horizontalTitleGap: 75,
                        leading:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Text(
                            "emailInputLabel".tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),

                          ),
                        ),
                        trailing: Text(
                          controller.currentUser!.mail,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    Card(
                      child: ListTile(
                        horizontalTitleGap: 73,
                        leading:  Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Text(
                            "phoneInputLabel".tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),

                          ),
                        ),
                        trailing: Text(
                          controller.currentUser!.telephone,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade500),
                          textDirection: LocationUtils.changeTextDirection(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.amber.shade700),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                          fixedSize: MaterialStateProperty.all(const Size(160, 47) ),
                        ),
                        child: Text(
                          "update".tr,
                          style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          //controller.checkPassword();
                        },
                      ),
                    )
                  ]
                ),
              ),
            )
    );
  }
}
