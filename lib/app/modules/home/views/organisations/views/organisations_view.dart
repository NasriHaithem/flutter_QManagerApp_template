import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/views/categories/bindings/categories_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/views/categories/views/categories_view.dart';
import 'package:mobile_app/app/services/categoryService.dart';

import '../controllers/organisations_controller.dart';

class OrganisationsView extends GetView<OrganisationsController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(

              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 170.0,
                      child: Image.asset(
                            "assets/search_image.png",
                            scale: 2
                        ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(
                              () => CategoriesView(),
                              binding: CategoriesBinding(),
                              arguments: CategoryService.categoryList
                          );
                        },
                        padding: const EdgeInsets.all(7.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Colors.deepPurpleAccent, Color(0xff374ABE), ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 35.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "Search for organisations",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(

              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 170.0,
                      child: Image.asset(
                          "assets/icons8-user-location-96.png",
                          scale: 0.7
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7.0),
                      alignment: Alignment.center,
                      child: MaterialButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(7.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Colors.deepPurpleAccent, Color(0xff374ABE), ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 35.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "Find nearest sites",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
        ),
    );
  }
}
/*child: Obx( () =>
ListView(
children: [
for(var item in controller.list)
Card(
child: ListTile(
title: Text(controller.getItemName(item)),
trailing: const Icon(Icons.chevron_right),
),
)
],
)
),*/