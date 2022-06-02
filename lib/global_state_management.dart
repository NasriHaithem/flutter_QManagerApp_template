import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalState extends GetxController{
  static GlobalState get globalState => Get.find<GlobalState>();
  Rx<Position>? userPosition;

}