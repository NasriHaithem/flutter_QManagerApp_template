import 'dart:convert';
import 'package:mobile_app/app/models/AppUser.dart';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));
String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    required this.jwt,
    required this.user,
  });

  String jwt;
  AppUser user;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    jwt: json["jwt"],
    user: AppUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "jwt": jwt,
    "user": user.toJson(),
  };
}
