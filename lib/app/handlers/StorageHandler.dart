import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_app/app/models/AppUser.dart';

class StorageHandler {
  static const storage = FlutterSecureStorage();

  static Future<void> resetStorage() async{
    await storage.deleteAll();
  }

  static Future<void> storeToken(String token) async{
    await storage.write(key:"token",value:token);
  }

  static Future<String?> getToken() async{
    return await storage.read(key:"token");
  }

  static Future<void> storeUser(AppUser user) async{
    await storage.write(key:"user",value:appUserToJson(user));
  }

  static Future<AppUser?> getUserFromStorage() async{
    String? userString = await storage.read(key:"user");

    if(userString == null) return null;
    return appUserFromJson(userString);
  }
}