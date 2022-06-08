import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/modules/home/views/profile/views/account_credentials/bindings/account_credentials_binding.dart';
import 'package:mobile_app/app/modules/home/views/profile/views/account_credentials/views/account_credentials_view.dart';
import 'package:mobile_app/app/modules/home/views/profile/views/update_password/bindings/update_password_binding.dart';
import 'package:mobile_app/app/modules/home/views/profile/views/update_password/views/update_password_view.dart';
import 'package:mobile_app/app/modules/login/bindings/login_binding.dart';
import 'package:mobile_app/app/modules/login/views/login_view.dart';
import 'package:mobile_app/app/widgets/dialogs/choose_language_dialog.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
        child: Column(
          children: [
            Row(
              children:  [
                const Icon(CupertinoIcons.profile_circled, color: Colors.deepPurpleAccent,),
                const SizedBox(width: 10.0,),
                Text(
                  "accountTitle".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54
                  ),
                )
              ],
            ),

            const Divider(height: 20.0,color: Colors.black38),
            const SizedBox(height: 10,),

            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children:  <Widget>[
                //UPDATE PASSWORD
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(
                          () => UpdatePasswordView(),
                          binding: UpdatePasswordBinding()
                      );
                    },
                    leading: Icon(CupertinoIcons.lock_circle_fill, color: Colors.red.shade900,),
                    title: Text('passwordTileList'.tr),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
                //UPDATE LANGUAGE
                Card(
                  child: ListTile(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => LanguageDialog(),
                    ),
                    leading: Icon(Icons.g_translate, color: Colors.blue.shade900,),
                    title: Text('languageTileList'.tr),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
                //ACCOUNT CREDENTIALS
                Card(
                  child: ListTile(
                    onTap: () {
                        Get.to(
                            () => AccountCredentialsView(),
                            binding: AccountCredentialsBinding()
                        );
                      },
                    leading: Icon(Icons.security, color: Colors.green.shade900,),
                    title: Text('credentialsTileList'.tr),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
                //LOG-OUT
                Card(
                  child: ListTile(
                    onTap: () async {
                      await StorageHandler.resetStorage();
                      Get.to(
                              () => LoginView(),
                          binding: LoginBinding()
                      );
                    },
                    leading: Icon(Icons.logout, color: Colors.black,),
                    title: Text('logoutTileList'.tr),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
