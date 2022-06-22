import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/organisation_details/bindings/organisation_details_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/organisation_details/views/organisation_details_view.dart';
import 'package:mobile_app/app/widgets/CustomCard.dart';
import 'package:mobile_app/app/widgets/dialogs/choose_language_dialog.dart';

import '../controllers/organisations_list_controller.dart';

class OrganisationsListView extends GetView<OrganisationsListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Organisations List'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),

              //Search Field
              Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          topRight: Radius.circular(7.0),
                          )
                    ),

                    child: TextField(
                      style: const TextStyle(color: Colors.deepPurpleAccent),
                      onChanged: (value) => controller.filterOrganisations(value),
                      decoration: const InputDecoration(

                        labelText: 'Search',
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
              const SizedBox(
                height: 10,
              ),

              //Cards List
              Expanded(
                  child: Obx(
                      () => GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: controller.foundOrganisations.value.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              borderRadius:  const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                                 BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(0.0, 0.0, ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                          ),

                          child: CustomCard(
                              data: controller.foundOrganisations.value[index].name,
                              image: controller.foundOrganisations.value[index].logo,
                              function: () {
                                Get.to(
                                    () => OrganisationDetailsView(),
                                    binding: OrganisationDetailsBinding(),
                                    arguments:  controller.foundOrganisations.value[index]
                                );
                              }
                          ),
                        ),
                      )
                  )
              ),

            ]
        ),
    )



      );
  }
}
