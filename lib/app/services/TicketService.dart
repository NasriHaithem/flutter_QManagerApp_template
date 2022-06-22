import'package:http/http.dart'as http;
import 'package:mobile_app/app/handlers/ApiHandler.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/models/Service.dart';

class TicketService {
  static const String qmanagerBaseEndpoint = "/qmanager";

  static Future<http.Response> reserveTicket(int siteId, String userId, Service service) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler
        .post(
        serviceToJson(service),
        "$qmanagerBaseEndpoint/newTicket/$siteId/$userId",
        token
    );
  }

  static Future<http.Response> getTicketsByUser(String userId) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler
        .get("$qmanagerBaseEndpoint/getTicketsByUserId/$userId",token);
  }

  static Future<http.Response> cancelTicket(String ticketId) async{
    String? token = await StorageHandler.getToken();
    token = token ?? "";
    return await NetworkHandler
        .get("$qmanagerBaseEndpoint/cancelTicket/$ticketId",token);
  }
}