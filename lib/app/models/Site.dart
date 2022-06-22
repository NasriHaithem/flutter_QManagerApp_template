import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Site siteFromJson(String str) => Site.fromJson(json.decode(str));
String siteToJson(Site data) => json.encode(data.toJson());

class Site {
  //Constructor
  Site({
    required siteId,
    required nomSiteFR,
    required nomSiteAR,
    required nomSiteEN,
    required adresseFR,
    required adresseAR,
    required adresseEN,
    required longitude,
    required latitude,
    required waiting,
    required timeToWait,
  }) :
         _siteId = siteId,
         _nomSiteFR = nomSiteFR,
         _nomSiteAR = nomSiteAR,
         _nomSiteEN = nomSiteEN,
         _adresseFR = adresseFR,
         _adresseAR = adresseAR,
         _adresseEN = adresseEN,
         _longitude = longitude,
         _latitude = latitude,
         _waiting = waiting,
         _timeToWait = timeToWait;

  //Properties
  int _siteId;
  String? _nomSiteFR;
  String? _nomSiteAR;
  String? _nomSiteEN;
  String? _adresseFR;
  String? _adresseAR;
  String? _adresseEN;
  double _longitude;
  double _latitude;
  int _waiting;
  int _timeToWait;

  //Converters
  factory Site.fromJson(Map<String, dynamic> json) => Site(
    siteId: json["siteId"],
    nomSiteFR: json["nomSiteFR"],
    nomSiteAR: json["nomSiteAR"],
    nomSiteEN: json["nomSiteEN"],
    adresseFR: json["adresseFR"],
    adresseAR: json["adresseAR"],
    adresseEN: json["adresseEN"],
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    waiting: json["waiting"],
    timeToWait: json["timeToWait"],
  );
  Map<String, dynamic> toJson() => {
    "siteId": _siteId,
    "nomSiteFR": _nomSiteFR,
    "nomSiteAR": _nomSiteAR,
    "nomSiteEN": _nomSiteEN,
    "adresseFR": _adresseFR,
    "adresseAR": _adresseAR,
    "adresseEN": _adresseEN,
    "longitude": _longitude,
    "latitude": _latitude,
    "waiting": _waiting,
    "timeToWait": _timeToWait,
  };

  //Getters
  int get id => _siteId;
  int get waiting => _waiting;
  int get timeToWait => _timeToWait;
  double get longitude => _longitude;
  double get latitude => _latitude;
  String? get name {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return _nomSiteAR != null
          ? utf8.decode(_nomSiteAR!.codeUnits)
          : _nomSiteFR ?? _nomSiteEN;
      case "fr": return _nomSiteFR ?? _nomSiteEN ?? utf8.decode(_nomSiteAR!.codeUnits);
      default: return _nomSiteEN ?? _nomSiteFR ?? utf8.decode(_nomSiteAR!.codeUnits);
    }
  }
  String? get address {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return _adresseAR != null
          ? utf8.decode(_adresseAR!.codeUnits)
          : _adresseFR ?? _adresseEN;
      case "fr": return _adresseFR ?? _adresseEN ?? utf8.decode(_adresseAR!.codeUnits);
      default: return _adresseEN ?? _adresseFR ?? utf8.decode(_adresseAR!.codeUnits);
    }
  }
}
