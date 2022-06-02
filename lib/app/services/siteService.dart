import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SiteService {
  static const sitesList = [
    {
      "id": 1,

      "nomSiteFR": " nom site 1",
      "nomSiteAR": "اسم الموقع 1",
      "nomSiteEN": "site name 1",

      "adresseFR": "état, ville, rue",
      "adresseAR": "ولاية ، مدينة ، شارع",
      "adresseEN": "state, City, street",

      "delegationFR": "delegation 1",
      "delegationAR": "معتمدية 1",
      "delegationEN": "delegation 1",
    },
    {
      "id": 2,

      "nomSiteFR": " nom site 2",
      "nomSiteAR": "اسم الموقع 2",
      "nomSiteEN": "site name 2",

      "adresseFR": "état, ville, rue",
      "adresseAR": "ولاية ، مدينة ، شارع",
      "adresseEN": "state, City, street",

      "delegationFR": "delegation 2",
      "delegationAR": "معتمدية 2",
      "delegationEN": "delegation 2",
    },
    {
      "id": 3,

      "nomSiteFR": " nom site 3",
      "nomSiteAR": "اسم الموقع 3",
      "nomSiteEN": "site name 3",

      "adresseFR": "état, ville, rue",
      "adresseAR": "ولاية ، مدينة ، شارع",
      "adresseEN": "state, City, street",

      "delegationFR": "delegation 3",
      "delegationAR": "معتمدية 3",
      "delegationEN": "delegation 3",
    }
  ];

  static String getSiteName(site) {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return site["nomSiteAR"];
      case "fr": return site["nomSiteFR"];
      default: return site["nomSiteEN"];
    }
  }

  static String getSiteAddress(service) {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return service["adresseAR"];
      case "fr": return service["adresseFR"];
      default: return service["adresseEN"];
    }
  }
}