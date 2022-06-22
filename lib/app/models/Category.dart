import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required id,
    required categoryNameFr,
    required categoryNameAr,
    required categoryNameEn,
    required code,
  }) :  _id = id,
        _categoryNameFR = categoryNameFr,
        _categoryNameAR = categoryNameAr,
        _categoryNameEN = categoryNameEn,
        _code = code;

  int _id;
  String _categoryNameFR;
  String _categoryNameAR;
  String _categoryNameEN;
  String _code;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryNameFr: json["categoryNameFR"],
    categoryNameAr: json["categoryNameAR"],
    categoryNameEn: json["categoryNameEN"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": _id,
    "categoryNameFR": _categoryNameFR,
    "categoryNameAR": _categoryNameAR,
    "categoryNameEN": _categoryNameEN,
    "code": _code,
  };

  int get id => _id;
  String get code => _code;
  String get name {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return utf8.decode(_categoryNameAR.codeUnits);
      case "fr": return _categoryNameFR;
      default: return _categoryNameEN;
    }
  }
}
