import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import'package:http/http.dart'as http;
import 'package:mobile_app/app/handlers/ApiHandler.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/models/Service.dart';

class SiteService {
  static const String qmanagerBaseEndpoint = "/qmanager";

  static Future<http.Response> getSitesByOrgAndServiceAndAddress(String orgName, int serviceId, String gov, String delegation) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler
        .get(
            "$qmanagerBaseEndpoint/getSitesByTypeAndServiceAndGouvernoratAndDelegation/$orgName/$serviceId/$gov/$delegation",
            token
        );
  }

  static Future<http.Response> getSitesByOrgAndServiceAndGpsCoordinates(String orgName, int serviceId, double latitude, double longitude) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler
        .get(
        "$qmanagerBaseEndpoint/organisation/$orgName/service/$serviceId/sites/location/$latitude/$longitude",
        token
    );
  }



}