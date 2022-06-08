import 'dart:convert';

import'package:http/http.dart'as http;
import 'package:mobile_app/app/dto/authRequest.dart';
import 'package:mobile_app/app/handlers/ApiHandler.dart';
import 'package:mobile_app/app/models/AppUser.dart';

class UserService {
    static const String userBaseEndpoint = "/user";

    static Future<http.Response> login(AuthRequest appUser) async {
      return await NetworkHandler.post(authRequestToJson(appUser), "/login");
    }

    static Future<http.Response> register(AppUser appUser) async {
      return await NetworkHandler.post(appUserToJson(appUser), "$userBaseEndpoint/");
    }

    static Future<http.Response> sendActivationCodeToEmail(String phone, String code) async {
      final body = {
        "id": phone,
        "code": code,
      };
      final String jsonBody = jsonEncode(body);
      return await NetworkHandler.post(jsonBody, "$userBaseEndpoint/sendSmsConfirmation");
    }

    static Future<http.Response> activateAccount(String phone, AppUser appUser) async {
      return await NetworkHandler.post(appUserToJson(appUser), "$userBaseEndpoint/activate-account/$phone");
    }

    static Future<http.Response> findUserByMail(String mail) async {
      AppUser appUser = AppUser(nom: "", prenom: "", mail: mail, password: "", telephone: "");
      return await NetworkHandler.post(appUserToJson(appUser), "$userBaseEndpoint/mail");
    }

    static Future<http.Response> resetPassword(String phone, AppUser appUser) async {
      return await NetworkHandler.post(appUserToJson(appUser), "$userBaseEndpoint/reset-password/$phone");
    }

}