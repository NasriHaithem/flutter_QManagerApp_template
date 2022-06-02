import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareLocationController extends GetxController {
  //TODO: Implement ShareLocationController

  late final dynamic organisation;
  late final dynamic pickedService;
  var selectedGovernorate = "".obs;
  @override
  void onInit() {
    organisation = Get.arguments['organisation'];
    pickedService = Get.arguments['service'];
    print("organisation: $organisation");
    print("pickedService: $pickedService");
    super.onInit();
  }

  List<DropdownMenuItem<String>> get governorateItems{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "", child: Text("Select Item Type"), enabled: false,),
      const DropdownMenuItem(value: "USA", child: Text("USA")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }




  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
