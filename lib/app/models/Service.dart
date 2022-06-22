import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));
String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    required id,
    required titleFR,
    required titleAR,
    required titleEN,
    required descriptionFR,
    required descriptionAR,
    required descriptionEN,
    required notificationFR,
    required notificationAR,
    required notificationEN,
  }) :
      _id = id,
      _titleAR = titleAR,
      _titleFR = titleFR,
      _titleEN = titleEN,
      _descriptionFR = descriptionFR,
      _descriptionAR = descriptionAR,
      _descriptionEN = descriptionEN,
      _notificationFR = notificationFR,
      _notificationAR = notificationAR,
      _notificationEN = notificationEN;

  int _id;
  String? _titleFR;
  String? _titleAR;
  String? _titleEN;
  String? _descriptionFR;
  String? _descriptionAR;
  String? _descriptionEN;
  String? _notificationFR;
  String? _notificationAR;
  String? _notificationEN;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    titleFR: json["title_FR"],
    titleAR: json["title_AR"],
    titleEN: json["title_EN"],
    descriptionFR: json["descriptionFR"],
    descriptionAR: json["descriptionAR"],
    descriptionEN: json["descriptionEN"],
    notificationFR: json["notificationFR"],
    notificationAR: json["notificationAR"],
    notificationEN: json["notificationEN"],
  );

  Map<String, dynamic> toJson() => {
    "id": _id,
    "title_FR": _titleFR,
    "title_AR": _titleAR,
    "title_EN": _titleEN,
    "descriptionFR": _descriptionFR,
    "descriptionAR": _descriptionAR,
    "descriptionEN": _descriptionEN,
    "notificationFR": _notificationFR,
    "notificationAR": _notificationAR,
    "notificationEN": _notificationEN,
  };

  int get id => _id;
  String get name {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return _titleAR != null
          ? utf8.decode(_titleAR!.codeUnits)
          : _titleFR ?? _titleEN!;
      case "fr": return _titleFR ?? _titleEN ?? utf8.decode(_titleAR!.codeUnits);
      default: return _titleEN ?? _titleFR ?? utf8.decode(_titleAR!.codeUnits);
    }
  }
  String? get description {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return _descriptionAR != null
          ? utf8.decode(_descriptionAR!.codeUnits)
          : _descriptionFR ?? _descriptionEN;

      case "fr": return _descriptionFR
          ?? _descriptionEN
          ?? (_descriptionAR!=null ? utf8.decode(_descriptionAR!.codeUnits)  : null) ;

      default: return _descriptionEN
          ?? _descriptionFR
          ?? (_descriptionAR!=null ? utf8.decode(_descriptionAR!.codeUnits)  : null) ;
    }
  }
  String? get notification {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return _notificationAR != null
          ? utf8.decode(_notificationAR!.codeUnits)
          : _notificationFR ?? _notificationEN!;

      case "fr": return _notificationFR
          ?? _notificationEN
          ?? (_notificationAR!=null ? utf8.decode(_notificationAR!.codeUnits)  : null);

      default: return _notificationEN
          ?? _notificationFR
          ?? (_notificationAR!=null ? utf8.decode(_notificationAR!.codeUnits)  : null);
    }
  }
}
