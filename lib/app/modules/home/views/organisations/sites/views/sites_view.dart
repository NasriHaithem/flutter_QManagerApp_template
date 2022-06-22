import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_app/app/modules/home/views/home_view.dart';
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
        body:  Obx(
            () => controller.isLoading.value
            ? Text("data")
            : Container(
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    //Organisation Cover
                    SizedBox(
                      height: 250,
                      child: Hero(
                        tag:double.parse(controller.organisation.name.codeUnits.join()),
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
                          controller.service.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[800]
                          )
                      ),
                      subtitle: Text("Choose a site to register in."),

                      trailing: Container(
                        width: 140,
                        height: 59,

                        child: DropdownButtonFormField(
                          dropdownColor: Colors.deepPurple,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.deepPurple,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                          isExpanded: true,
                          value:  controller.filterValue.value,
                          items:  controller.filterItems,
                          onChanged: (value) {
                            controller.filterValue.value = value.toString();
                          },
                        ),
                      ),

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
                            itemCount: controller.foundSites.value.length,
                            itemBuilder: (context, index) => Card(
                              child: ListTile(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: "Get ticket",
                                      backgroundColor: Colors.white,
                                      titleStyle: const TextStyle(color: Colors.black),
                                      textConfirm: "Confirm",
                                      textCancel: "Cancel",
                                      cancelTextColor: Colors.black,
                                      confirmTextColor: Colors.white,
                                      onConfirm: () async{
                                        await controller.getTicket(
                                            controller.foundSites.value[index].id,
                                            controller.service
                                        );

                                        Get.offAll(
                                                () => HomeView()..controller.tabIndex=2,
                                            binding: HomeBinding()
                                        );
                                      },
                                      barrierDismissible: false,
                                      radius: 50,
                                      content: Column(
                                        children: [
                                          Container(child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Service:"),
                                              Text(controller.service.name)
                                            ],
                                          )),
                                          Container(child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("Site:"),
                                              Text(controller.foundSites.value[index].name.toString())
                                            ],
                                          )),
                                          Container(child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("In-line:"),
                                              Text(controller.foundSites.value[index].waiting.toString())
                                            ],
                                          )),
                                        ],
                                      )
                                  );
                                },
                                title: Text(
                                  controller.foundSites.value[index].name.toString(),
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  controller.foundSites.value[index].address.toString(),
                                ),
                                trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children:  [
                                  Text(controller.foundSites.value[index].waiting.toString()), // <-- Text
                                  const SizedBox(
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
                    ),
                  ],
                ),
              )
        )
    );
  }
}
