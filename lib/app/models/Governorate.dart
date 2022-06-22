import 'dart:convert';
import 'package:mobile_app/app/models/Delegation.dart';

Governorate serviceFromJson(String str) => Governorate.fromJson(json.decode(str));
String serviceToJson(Governorate data) => json.encode(data.toJson());

class Governorate {
  Governorate({
    required name,
    required delegations,
  }) :
      _name = name,
      _delegations = delegations;

  String _name;
  List<Delegation> _delegations;

  factory Governorate.fromJson(Map<String, dynamic> json) => Governorate(
    name: json["name"],
    delegations: List<Delegation>.from(json["delegations"].map((x) => Delegation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": _name,
    "delegations": List<dynamic>.from(_delegations.map((x) => x.toJson())),
  };

  String get name => utf8.decode(_name.codeUnits);
  List<Delegation> get delegations => _delegations;

}


