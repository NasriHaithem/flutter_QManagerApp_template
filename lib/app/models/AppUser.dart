// To parse this JSON data, do
//
//     final appUser = appUserFromJson(jsonString);

import 'dart:convert';

AppUser appUserFromJson(String str) => AppUser.fromJson(json.decode(str));
String appUserToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
  //CONSTRUCTOR
  AppUser({
    required this.nom,
    required this.prenom,
    required this.mail,
    required this.password,
    required this.telephone,
    required this.status,
  });

  //PROPERTIES
  String nom;
  String prenom;
  String mail;
  String password;
  String telephone;
  String status;

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
    nom: json["nom"],
    prenom: json["prenom"],
    mail: json["mail"],
    password: json["password"],
    telephone: json["telephone"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "prenom": prenom,
    "mail": mail,
    "password": password,
    "telephone": telephone,
    "status": status,
  };
}
