import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/bindings/share_location_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/views/share_location_view.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/bindings/sites_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/views/sites_view.dart';
import 'package:mobile_app/app/services/organisationService.dart';
import 'package:mobile_app/app/services/serviceService.dart';

import '../controllers/organisation_details_controller.dart';

class OrganisationDetailsView extends GetView<OrganisationDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: controller.searchInput,
                  onChanged: (value) => controller.filterServices(value),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controller.searchInput.clear();
                          controller.foundServices.value = controller.allServices;
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none
                  ),
                ),
              ),
            )
        ),
        extendBodyBehindAppBar: true,

        body: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Organisation Cover
              SizedBox(
                height: 250,
                child: Hero(
                  tag: double.parse(controller.organisation.name.codeUnits.join()),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.memory(controller.organisation.logo, fit: BoxFit.cover),
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child:  Image.memory(
                              controller.organisation.logo,
                              height: 300,
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //Organisation Title
              ListTile(
                  title: Text(
                      controller.organisation.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[800]
                      )
                  ),

                subtitle: Text("Pick a service to register in."),
              ),

              //The services list
              Expanded(
                child: Obx(
                  () => MediaQuery(
                    data: MediaQuery.of(context).removePadding(
                      removeLeft: false,
                      removeTop: false,
                      removeRight: false,
                      removeBottom: false,
                    ),
                    child: ListView.builder(

                      itemCount: controller.foundServices.value.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: () {
                            controller.navigateToNextPage(controller.foundServices.value[index]);
                          },
                          title: Text(
                            controller.foundServices.value[index].name,
                            style:
                            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.chevron_right),

                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
