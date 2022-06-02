import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/bindings/sites_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/views/sites_view.dart';
import 'package:mobile_app/app/services/organisationService.dart';
import 'package:mobile_app/app/utils/location_utils.dart';
import 'package:mobile_app/global_state_management.dart';

import '../controllers/share_location_controller.dart';

class ShareLocationView extends GetView<ShareLocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Organisation Cover
              ClipRRect(
                  child: Hero(
                    tag: controller.organisation['id'].toString(),
                    child: Image.asset(
                      'assets/fake_logo.png',
                      height: 300,
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  )
              ),
              const SizedBox(height: 10),

              //Organisation Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            OrganisationService.getOrganisationName(controller.organisation),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey[800]
                            )
                        ),
                        const Text("Pick a service to register in."),
                      ],
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () async {
                          Future<Position?> result = LocationUtils.determinePosition();
                          Position? position = await result;
                          if (position != null) {
                            GlobalState.globalState.userPosition = Rx<Position>(position);
                            print("altitude: ${GlobalState.globalState.userPosition!.value.altitude}");
                            print("longitude: ${GlobalState.globalState.userPosition!.value.longitude}");
                            Get.off(
                                () => SitesView(),
                                binding: SitesBinding(),
                                arguments: {
                                  "organisation": controller.organisation,
                                  "service": controller.pickedService,
                                  "isLocationEnabled": true,
                                  "userPosition": position
                                },
                            );
                          }
                        },
                        child: Row(
                          children: const [
                            Text('Share your location'),
                            Icon(CupertinoIcons.location_solid)
                          ],
                        )
                    ),
                  ]
                ),
              ),

              //Governorate dropdown list
              Expanded(
                child: MediaQuery(
                  data: MediaQuery.of(context).removePadding(
                    removeLeft: false,
                    removeTop: false,
                    removeRight: false,
                    removeBottom: false,
                  ),
                  child: ListView(
                      children: [
                        Obx(
                          () => ListTile(
                            title: Text("Governorate : "),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            trailing: SizedBox(
                              height: 100, width: 200,
                              child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                                isExpanded: false,
                                value: controller.selectedGovernorate.value,
                                items: controller.governorateItems,
                                onChanged: (value) {
                                  controller.selectedGovernorate.value = value.toString();
                                },
                                hint: const SizedBox(
                                  width: 150,                      //and here
                                  child: Text(
                                    "Select Item Type",
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                style: const TextStyle(color: Colors.black, decorationColor: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Obx(
                          () => ListTile(
                            title: Text("Delegation : "),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            trailing: SizedBox(
                              height: 100, width: 200,
                              child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                                isExpanded: false,
                                value: controller.selectedGovernorate.value,
                                items: controller.governorateItems,
                                onChanged: (value) {
                                  controller.selectedGovernorate.value = value.toString();
                                },
                                hint: const SizedBox(
                                  width: 150,                      //and here
                                  child: Text(
                                    "Select Item Type",
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                style: const TextStyle(color: Colors.black, decorationColor: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),

              //Submit location information
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size.fromWidth(320)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Get.to(
                          () => SitesView(),
                        binding: SitesBinding(),
                        arguments: {
                            "organisation": controller.organisation,
                            "service": controller.pickedService,
                            "isLocationEnabled": false,
                        },
                        transition: Transition.rightToLeft
                      );
                    },
                    child: Text('Submit')
                ),
              ),

            ],
          ),
        ),
    );
  }
}
