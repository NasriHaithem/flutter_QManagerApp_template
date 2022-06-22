import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';

Organisation organisationFromJson(String str) => Organisation.fromJson(json.decode(str));
String organisationToJson(Organisation data) => json.encode(data.toJson());

class Organisation {
  Organisation({
    required String organisationNameFR,
    required String organisationNameAR,
    required String organisationNameEN,
    required String logo,
  }) :
        _organisationNameAR = organisationNameAR,
        _organisationNameFR = organisationNameFR,
        _organisationNameEN = organisationNameEN,
        _logo = logo;

  String _organisationNameFR;
  String _organisationNameAR;
  String _organisationNameEN;
  String _logo;

  factory Organisation.fromJson(Map<String, dynamic> json) => Organisation(
    organisationNameFR: json["organisationNameFR"],
    organisationNameAR: json["organisationNameAR"],
    organisationNameEN: json["organisationNameEN"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "organisationNameFR": _organisationNameFR,
    "organisationNameAR": _organisationNameAR,
    "organisationNameEN": _organisationNameEN,
    "logo": _logo,
  };

  Uint8List get logo  {
    List<dynamic> decodeLogo = jsonDecode(_logo);
    List<int> intList = decodeLogo.cast<int>();
    return Uint8List.fromList(intList);
  }
  String get name {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return utf8.decode(_organisationNameAR.codeUnits);
      case "fr": return _organisationNameFR;
      default: return _organisationNameEN;
    }
  }
}
