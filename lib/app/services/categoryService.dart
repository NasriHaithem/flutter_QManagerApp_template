import'package:http/http.dart'as http;
import 'package:mobile_app/app/handlers/ApiHandler.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';

class CategoryService {
  static const String qmanagerBaseEndpoint = "/qmanager";

  static Future<http.Response> getCategoriesByParentCode(String parentCode) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler.get("$qmanagerBaseEndpoint/categories/$parentCode", token);
  }
}