import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_app/app/modules/home/views/home_view.dart';
import 'package:mobile_app/app/modules/home/views/reservations/bindings/reservations_binding.dart';
import 'package:mobile_app/app/modules/home/views/reservations/views/reservations_view.dart';
import 'package:mobile_app/app/services/organisationService.dart';
import 'package:mobile_app/app/services/serviceService.dart';
import 'package:mobile_app/app/services/siteService.dart';

import '../controllers/sites_controller.dart';

class SitesView extends GetView<SitesController> {
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
                  onChanged: (value) => controller.filterSites(value),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controller.searchInput.clear();
                          controller.foundSites.value = controller.allSites;
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
              ClipRRect(
                  child: Image.asset(
                    'assets/fake_logo.png',
                    height: 300,
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
              ),
              const SizedBox(height: 10),

              //Organisation Title
              ListTile(
                title: Text(
                    ServiceService.getServiceName(controller.service),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800]
                    )
                ),

                trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.grey[400],
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                subtitle: Text("Choose a site to register in."),
              ),

              //The services list
              Expanded(
                child: Obx(
                      () => ListView.builder(

                    itemCount: controller.foundSites.value.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        onTap: () {
                          /*Get.to(
                                  () => SitesView(),
                              binding: SitesBinding(),
                              transition: Transition.rightToLeft
                          );*/
                          Get.defaultDialog(
                              title: "Get ticket",
                              backgroundColor: Colors.white,
                              titleStyle: const TextStyle(color: Colors.black),
                              textConfirm: "Confirm",
                              textCancel: "Cancel",
                              cancelTextColor: Colors.black,
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                Get.offAll(
                                        () => HomeView()..controller.tabIndex=0,
                                    binding: HomeBinding()
                                );
                              },
                              barrierDismissible: false,
                              radius: 50,
                              content: Column(
                                children: [
                                  Container(child:Text("#ticken: 23")),
                                  Container(child:Text("In-line: 13")),
                                  Container(child:Text("Service: The service 1")),
                                  Container(child:Text("Site: site name 1")),
                                ],
                              )
                          );
                        },
                        title: Text(
                          SiteService.getSiteName(controller.foundSites.value[index]),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          SiteService.getSiteAddress(controller.foundSites.value[index]),
                        ),
                        trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('12'), // <-- Text
                          SizedBox(
                            width: 5,
                          ),
                          Icon( Icons.group, size: 24.0, ),
                        ],
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
