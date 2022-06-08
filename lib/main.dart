import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/environment/environment.dart';
import 'package:mobile_app/app/handlers/StorageHandler.dart';
import 'package:mobile_app/app/i18n/AppTranslations.dart';
import 'package:mobile_app/global_state_management.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await dotenv.load(fileName: Environment.fileName);
  Get.put(GlobalState());

  var initialRoute = AppPages.INITIAL;
  var jwt = await StorageHandler.getToken();

  if ( jwt != null) {
    initialRoute = "/home";
  }
  print(await StorageHandler.getToken());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      translations: AppTranslations(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
    ),
  );
}
