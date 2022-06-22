import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/models/Governorate.dart';
import 'package:mobile_app/app/models/Organisation.dart';
import 'package:mobile_app/app/models/Service.dart';
import 'package:mobile_app/app/services/organisationService.dart';

class ShareLocationController extends GetxController {

  late final Organisation organisation;
  late final Service pickedService;
  late final List<Governorate> governorates;
  var selectedGovernorate = "".obs;
  var selectedDelegation = "".obs;
  RxBool isLoading = true.obs ;
  @override
  void onInit() async{
    organisation = Get.arguments['organisation'];
    pickedService = Get.arguments['service'];

    governorates = await getGovernoratesByOrganisation(organisation.name);
    isLoading.value = false;
    super.onInit();
  }

  Future<List<Governorate>> getGovernoratesByOrganisation(String orgName) async{
    var response = await OrganisationService.getGovernoratesByOrganisation(orgName);
    final List<dynamic> responseJson = jsonDecode(response.body);

    return responseJson
        .map((c) => Governorate.fromJson(c))
        .toList();
  }

  List<DropdownMenuItem<String>> get governorateItems{
    List<DropdownMenuItem<String>> menuItems = governorates.map( (gov) {
        return DropdownMenuItem(value: gov.name, child: Text(gov.name));
      }).toList();

    menuItems.insert(0, const DropdownMenuItem(value: "", child: Text("Select a governorate"), enabled: false,));
    return menuItems;
  }

  List<DropdownMenuItem<String>> get delegationItems{
    if(selectedGovernorate.isEmpty) {
      return [const DropdownMenuItem(value: "", child: Text("Select a delegation"))];

    }
    final Governorate pickedGovernorate = governorates.where((gov) => gov.name == selectedGovernorate.value).first;
    List<DropdownMenuItem<String>> menuItems = pickedGovernorate.delegations
        .map( (deleg) {
          return DropdownMenuItem(value: deleg.name, child: Text(deleg.name));
        }
        ).toList();

    menuItems.insert(0, const DropdownMenuItem(value: "", child: Text("Select a delegation"), enabled: false,));
    return menuItems;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
