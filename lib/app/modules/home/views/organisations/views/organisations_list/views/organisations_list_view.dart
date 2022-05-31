import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/views/organisation_details/bindings/organisation_details_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/views/organisation_details/views/organisation_details_view.dart';
import 'package:mobile_app/app/services/organisationService.dart';
import 'package:mobile_app/app/widgets/CustomCard.dart';

import '../controllers/organisations_list_controller.dart';

class OrganisationsListView extends GetView<OrganisationsListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
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
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:  BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              )
                          ),
                          child: CustomCard(
                              data: controller.foundOrganisations.value[index],
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
