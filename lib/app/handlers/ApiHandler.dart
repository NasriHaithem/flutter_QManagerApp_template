import'package:http/http.dart'as http;
import 'package:mobile_app/app/environment/environment.dart';

class NetworkHandler {
    static final client = http.Client();

    static Uri buildUrl(String endpoint) {
      String host = Environment.apiUrl;
      final apiPath = host + endpoint;
      return Uri.parse(apiPath);
    }

    static Future<http.Response> post(var body,String endpoint)async{
      return await client.post(
              buildUrl(endpoint),
              body:body,
              headers: {"Content-type":"application/json"}
          );
    }

    static Future<http.Response> get(String endpoint)async{
      return await client.get(
          buildUrl(endpoint),
          headers: {"Content-type":"application/json"}
      );
    }
}