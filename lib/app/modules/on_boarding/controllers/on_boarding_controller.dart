import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/data/on_boarding_info.dart';
import 'package:mobile_app/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_app/app/modules/home/views/home_view.dart';
import 'package:mobile_app/app/modules/login/views/login_view.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length -1;

  forwardAction(){
    if(isLastPage){
      Get.off(() => HomeView(), binding: HomeBinding());
    }else{
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
        'assets/order.png',
        'pageOneTitle'.tr,
        'pageOneInfo'.tr
    ),
    OnBoardingInfo(
        'assets/cook.png',
        'pageTwoTitle'.tr,
        'pageTwoInfo'.tr
    ),
    OnBoardingInfo(
        'assets/deliver.png',
        'pageThreeTitle'.tr,
        'pageThreeInfo'.tr
    ),
  ];


}
