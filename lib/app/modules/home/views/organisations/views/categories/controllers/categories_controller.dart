import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/views/organisations_list/bindings/organisations_list_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/views/organisations_list/views/organisations_list_view.dart';
import 'package:mobile_app/app/services/categoryService.dart';

class CategoriesController extends GetxController {

  //This codes stack will keep track on which categories the user picked in order.
  //So when he navigates back, the controller will remove last code and search
  //for the category corresponding to the code before the removed one.
  var codeStack = [].obs;

  //This list contains all the categories available, it will be initialized when
  //the user click on "Search for organisations".
  late final List<Map<String, dynamic>> allCategories;

  //This list is updated in 3 scenarios:
  //1 - When the user type something in the Search Bar.
  //2 - When the user pick a categories to check its sub-categories or its organisations.
  //3 - When the user navigate back.
  Rx<List<Map<String, dynamic>>> foundCategories = Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    allCategories = Get.arguments;
    foundCategories.value = allCategories;
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {}

  void filterCategories(String categoryName) {
    List<Map<String, dynamic>> results = [];
    if (categoryName.isEmpty) {
      results = allCategories;
    } else {
      results = allCategories
          .where((element) => getCategoryName(element)
          .toString()
          .toLowerCase()
          .contains(categoryName.toLowerCase()))
          .toList();
    }
    foundCategories.value = results;
  }

  String getCategoryName(category) {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return category["categoryNameAR"];
      case "fr": return category["categoryNameFR"];
      default: return category["categoryNameEN"];
    }
  }

  updateCategoriesList(category) {
    if(category['children'].isEmpty) {
      Get.to(
          () => OrganisationsListView(),
        binding: OrganisationsListBinding()
      );
      return;
    }
    foundCategories.value =  category['children'];
    codeStack.add(category['code']);
  }

  navigateBack() {
    if(codeStack.isEmpty) {
      //Popping pages until going back to home page.
      Get.until((route) => Get.currentRoute == '/home');
    }
    else {
      codeStack.removeLast();
      if(codeStack.isEmpty) {
        foundCategories.value = allCategories;
      }
      else {
        var categoriesByCode = CategoryService
            .getCategoriesByCode(codeStack[codeStack.length-1], allCategories);
        foundCategories.value = categoriesByCode;
      }
    }
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
