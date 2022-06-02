import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/favorites/controllers/favorites_controller.dart';
import 'package:mobile_app/app/modules/home/views/organisations/categories/controllers/categories_controller.dart';
import 'package:mobile_app/app/modules/home/views/profile/controllers/profile_controller.dart';
import 'package:mobile_app/app/modules/home/views/reservations/controllers/reservations_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(),);

    Get.lazyPut<CategoriesController>(() => CategoriesController());
    Get.lazyPut<FavoritesController>    (() => FavoritesController());
    Get.lazyPut<ReservationsController> (() => ReservationsController());
    Get.lazyPut<ProfileController>      (() => ProfileController());
  }
}
