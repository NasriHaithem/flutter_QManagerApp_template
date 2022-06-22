import'package:http/http.dart'as http;
import 'package:mobile_app/app/environment/environment.dart';

class NetworkHandler {
    static final client = http.Client();

    static Uri buildUrl(String endpoint) {
      String host = Environment.apiUrl;
      final apiPath = host + endpoint;
      return Uri.parse(apiPath);
    }

    static Future<http.Response> post(var body, String endpoint, [String token = ""])async{
      var headers =  token.isNotEmpty
                                ? {
                                  "Content-type":"application/json",
                                  'Authorization': 'Bearer $token',
                                }
                                : {
                                    "Content-type":"application/json",
                                  };
      return await client.post(
              buildUrl(endpoint),
              body:body,
              headers: headers
          );
    }

    static Future<http.Response> get(String endpoint, [String token = ""])async{
      var headers =  token.isNotEmpty
                                  ? {
                                      "Content-type":"application/json",
                                      'Authorization': 'Bearer $token',
                                    }
                                  : {
                                      "Content-type":"application/json",
                                    };
      return await client.get(
          buildUrl(endpoint),
          headers: headers
      );
    }
}