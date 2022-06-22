import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
Delegation delegationFromJson(String str) => Delegation.fromJson(json.decode(str));
String delegationToJson(Delegation data) => json.encode(data.toJson());

class Delegation {
  Delegation({
    required frensh,
    required arabic,
    required english,
  }) :
      _frensh = frensh,
      _arabic = arabic,
      _english = english;

  String _frensh;
  String _arabic;
  String _english;

  factory Delegation.fromJson(Map<String, dynamic> json) => Delegation(
    frensh: json["frensh"],
    arabic: json["arabic"],
    english: json["english"],
  );

  Map<String, dynamic> toJson() => {
    "frensh": _frensh,
    "arabic": _arabic,
    "english": _english,
  };

  String get name {
    Locale locale = Get.locale ?? const Locale("en");
    switch(locale.toString()) {
      case "ar": return utf8.decode(_arabic.codeUnits);
      case "fr": return _frensh;
      default: return _english;
    }
  }
}