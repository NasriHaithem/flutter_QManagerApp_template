import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/bindings/share_location_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/share_location/views/share_location_view.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/bindings/sites_binding.dart';
import 'package:mobile_app/app/modules/home/views/organisations/sites/views/sites_view.dart';
import 'package:mobile_app/global_state_management.dart';

class FavoritesController extends GetxController {

  void navigateToNextPage() {
    final position = GlobalState.globalState.userPosition;
    if( position == null) {
      Get.to(
              () => ShareLocationView(),
          binding: ShareLocationBinding(),
          arguments: {
            "organisation":
            {
              "id": 1,
              "nomOrganisationFR": "nom d'un organisation",
              "nomOrganisationAR": "اسم المنظمة",
              "nomOrganisationEN": "Organisation name",
            },
            "service":
            {
              "id": 1,
              "nomServiceFR": "Copie conforme",
              "nomServiceAR": "نسخة طبق الأصل",
              "nomServiceEN": "Identical copy",
              "descriptionFR": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
              "descriptionEN": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
              "descriptionAR": "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.",
              "notificationFR": "N'oublier pas votre CIN",
              "notificationAR": "لا تنسى رقم CIN الخاص بك",
              "notificationEN": "Don't forget your CIN",
            },
          },
          transition: Transition.rightToLeft
      );
    }
    else {
      Get.to(
              () => SitesView(),
          binding: SitesBinding(),
          arguments: {
            "organisation":
              {
                "id": 1,
                "nomOrganisationFR": "nom 1",
                "nomOrganisationAR": "اسم 1",
                "nomOrganisationEN": "name 1 name 1 name 1 name 1",
              },
            "service":
            {
              "id": 1,
              "nomServiceFR": "Le service 1",
              "nomServiceAR": "خدمة 1",
              "nomServiceEN": "The service 1",
              "descriptionFR": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
              "descriptionEN": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
              "descriptionAR": "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.",
              "notificationFR": "N'oublier pas votre CIN",
              "notificationAR": "لا تنسى رقم CIN الخاص بك",
              "notificationEN": "Don't forget your CIN",
            },
            "isLocationEnabled": true,
            "position": position
          },
          transition: Transition.rightToLeft
      );

    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
