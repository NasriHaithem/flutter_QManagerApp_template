import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/models/Category.dart';
import 'package:mobile_app/app/models/Organisation.dart';
import 'package:mobile_app/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_app/app/modules/home/views/home_view.dart';
import 'package:mobile_app/app/modules/home/views/organisations/organisations_list/bindings/organisations_list_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/organisations_list/views/organisations_list_view.dart';
import 'package:mobile_app/app/services/categoryService.dart';
import 'package:mobile_app/app/services/organisationService.dart';

class CategoriesController extends GetxController {

  //This codes stack will keep track on which categories the user picked in order.
  //So when he navigates back, the controller will remove last code and search
  //for the category corresponding to the code before the removed one.
  var codeStack = ["000"].obs;

  //This list contains all the categories available, it will be initialized when
  //the user click on "Search for organisations".
  late List<Category> allCategories;

  //This list is updated in 3 scenarios:
  //1 - When the user type something in the Search Bar.
  //2 - When the user pick a categories to check its sub-categories.
  //3 - When the user navigate back.
  Rx<List<Category>> foundCategories = Rx<List<Category>>([]);

  @override
  void onInit() async{
    super.onInit();
    allCategories = await getCategoriesByParentCode(codeStack[codeStack.length-1]);
    foundCategories.value = allCategories;
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {}

  Future<List<Category>> getCategoriesByParentCode(String code) async{
    var response = await CategoryService.getCategoriesByParentCode(code);
    final List<dynamic> responseJson = jsonDecode(response.body);

    return responseJson
        .map((c) => Category.fromJson(c))
        .toList();
  }

  Future<List<Organisation>> getOrganisationsByCategoryCode(String code) async{
    var response = await OrganisationService.getOrganisationsByCategoryCode(code);
    print('${response.body}');
    final List<dynamic> responseJson = jsonDecode(response.body);

    print("fromjson: $responseJson");
    return responseJson
        .map((c) => Organisation.fromJson(c))
        .toList();
  }

  void filterCategories(String categoryName) {
    List<Category> results = [];
    if (categoryName.isEmpty) {
      results = allCategories;
    } else {
      results = allCategories
          .where((categoryElement) => categoryElement.name
          .toString()
          .toLowerCase()
          .contains(categoryName.toLowerCase()))
          .toList();
    }
    foundCategories.value = results;
  }

  void updateCategoriesList(Category category) async{
    List<Category> childrenCategories = await getCategoriesByParentCode(category.code);
    if(childrenCategories.isEmpty) {
      List<Organisation> organisationsByCode = await getOrganisationsByCategoryCode(category.code);

      Get.to(
          () => OrganisationsListView(),
        binding: OrganisationsListBinding(),
        arguments: organisationsByCode,
        transition: Transition.rightToLeft
      );
      return;
    }
    allCategories = childrenCategories;
    foundCategories.value =  childrenCategories;
    codeStack.add(category.code);
    print("code : $codeStack");
  }

  navigateBack() async{

    codeStack.removeLast();
    allCategories = await getCategoriesByParentCode(codeStack[codeStack.length -1]);
    foundCategories.value =  allCategories;
    print("code : $codeStack");

  }

  displayBackArrow() {
    return
      codeStack.length > 1
        ?
      IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => navigateBack(),
      )
        :
      Container();
  }
  splitCode(String code) {
    const splitSize = 3;
    RegExp exp = RegExp(r"{\d{" + "$splitSize" + "}}");
    Iterable<Match> matches = exp.allMatches(code);
    String tempCode = "";
    var list = matches.map( (m)  {
      tempCode += m.group(0).toString();
      return tempCode;
    });
    return list;
  }
}
