import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/models/AppUser.dart';

class AccountCredentialsController extends GetxController {

  RxBool isLoading = true.obs;

  late AppUser? currentUser;
  @override
  void onInit() async {
    super.onInit();
    currentUser = await StorageHandler.getUserFromStorage();
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
