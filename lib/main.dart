import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/i18n/AppTranslations.dart';
import 'package:mobile_app/global_state_management.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(GlobalState());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
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
