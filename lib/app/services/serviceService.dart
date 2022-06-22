import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import'package:http/http.dart'as http;
import 'package:mobile_app/app/dto/OrganisationRequest.dart';
import 'package:mobile_app/app/handlers/ApiHandler.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';

class ServiceService {
  static const String qmanagerBaseEndpoint = "/qmanager";

  static Future<http.Response> getServicesByOrganisationName(String orgName) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler.post(
        orgRequestToJson(OrganisationRequest(name: orgName)),
        "$qmanagerBaseEndpoint/getServicesByOrganisation",
        token);
  }

  static Future<http.Response> getServiceByIdAndSiteId(int siteId, int serviceId) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler.get(
        "$qmanagerBaseEndpoint/sites/$siteId/services/$serviceId",
        token);
  }
}