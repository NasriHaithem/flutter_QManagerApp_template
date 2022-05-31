import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/favorites/views/favorites_view.dart';
import 'package:mobile_app/app/modules/home/views/organisations/views/organisations_view.dart';
import 'package:mobile_app/app/modules/home/views/profile/views/profile_view.dart';
import 'package:mobile_app/app/modules/home/views/reservations/views/reservations_view.dart';
import 'package:mobile_app/app/widgets/dialogs/choose_language_dialog.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Marhba!", textDirection: TextDirection.ltr),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children:  [
                OrganisationsView(),
                FavoritesView(),
                ReservationsView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black38,
            selectedItemColor: Colors.deepPurpleAccent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 20.0,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.building_2_fill),
                label: 'organisationsTag'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.suit_heart_fill),
                label: 'favoritesTag'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.tickets_fill),
                label: 'reservationsTag'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.profile_circled),
                label: 'profileTag'.tr,
              ),
            ],
          ),
        );
      },
    );
  }
}
