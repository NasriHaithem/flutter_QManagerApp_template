import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrganisationService {
  static const organisationList = [
    {
      "id": 1,
      "nomOrganisationFR": "nom 1",
      "nomOrganisationAR": "اسم 1",
      "nomOrganisationEN": "name 1",
    },
    {
      "id": 2,
      "nomOrganisationFR": "nom 2",
      "nomOrganisationAR": "اسم 2",
      "nomOrganisationEN": "name 2",
    },
    {
      "id": 3,
      "nomOrganisationFR": "nom 3",
      "nomOrganisationAR": "اسم 3",
      "nomOrganisationEN": "name 3",
    },
    {
      "id": 4,
      "nomOrganisationFR": "nom 4",
      "nomOrganisationAR": "اسم 4",
      "nomOrganisationEN": "name 4",
    },
    {
      "id": 5,
      "nomOrganisationFR": "nom 5",
      "nomOrganisationAR": "اسم 5",
      "nomOrganisationEN": "name 5",
    },
  ];

  static String getOrganisationName(organisation) {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return organisation["nomOrganisationAR"];
      case "fr": return organisation["nomOrganisationFR"];
      default: return organisation["nomOrganisationEN"];
    }
  }

}