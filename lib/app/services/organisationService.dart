import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import'package:http/http.dart'as http;
import 'package:mobile_app/app/dto/OrganisationRequest.dart';
import 'package:mobile_app/app/handlers/ApiHandler.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';

class OrganisationService {
  static const String qmanagerBaseEndpoint = "/qmanager";

  static Future<http.Response> getOrganisationsByCategoryCode(String code) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler.get("$qmanagerBaseEndpoint/categories/$code/allOrganisations", token);
  }

  static Future<http.Response> getGovernoratesByOrganisation(String orgName) async {
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler.post(
        orgRequestToJson(OrganisationRequest(name: orgName)),
        "$qmanagerBaseEndpoint/getGouvernoratsByOrganisation",
        token);
  }
}