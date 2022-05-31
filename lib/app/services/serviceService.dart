import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceService {

  static const servicesList = [
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
    {
      "id": 2,
      "nomServiceFR": "Le service 2",
      "nomServiceAR": "خدمة 2",
      "nomServiceEN": "The service 2",
      "descriptionFR": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
      "descriptionEN": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
      "descriptionAR": "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.",
      "notificationFR": "N'oublier pas votre CIN",
      "notificationAR": "لا تنسى رقم CIN الخاص بك",
      "notificationEN": "Don't forget your CIN",
    },
    {
      "id": 3,
      "nomServiceFR": "Le service 3",
      "nomServiceAR": "خدمة 3",
      "nomServiceEN": "The service 3",
      "descriptionFR": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
      "descriptionEN": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
      "descriptionAR": "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.",
      "notificationFR": "N'oublier pas votre CIN",
      "notificationAR": "لا تنسى رقم CIN الخاص بك",
      "notificationEN": "Don't forget your CIN",
    },
    {
      "id": 4,
      "nomServiceFR": "Le service 4",
      "nomServiceAR": "خدمة 4",
      "nomServiceEN": "The service 4",
      "descriptionFR": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
      "descriptionEN": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
      "descriptionAR": "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.",
      "notificationFR": "N'oublier pas votre CIN",
      "notificationAR": "لا تنسى رقم CIN الخاص بك",
      "notificationEN": "Don't forget your CIN",
    },
    {
      "id": 5,
      "nomServiceFR": "Le service 5",
      "nomServiceAR": "خدمة 5",
      "nomServiceEN": "The service 5",
      "descriptionFR": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
      "descriptionEN": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique vitae velit vitae convallis. Donec cursus leo et ipsum sollicitudin, sit amet facilisis eros imperdiet. Pellentesque pellentesque consequat nulla et rutrum. Nulla lobortis mollis nunc sit amet iaculis. Morbi nec eros volutpat, ornare ante nec, tempor lacus. Nam cursus dictum orci,",
      "descriptionAR": "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.",
      "notificationFR": "N'oublier pas votre CIN",
      "notificationAR": "لا تنسى رقم CIN الخاص بك",
      "notificationEN": "Don't forget your CIN",
    },
  ];

  static String getServiceName(services) {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return services["nomServiceAR"];
      case "fr": return services["nomServiceFR"];
      default: return services["nomServiceEN"];
    }
  }
}