import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/i18n/AppTranslations.dart';


class LanguageDialog extends StatelessWidget {
  final List locales = AppTranslations.LOCALS;

  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('chooseLangDialogTitle'.tr),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: locales.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(child: Text(locales[index]['name']),onTap: (){
                  updateLanguage(locales[index]['locale']);
                }),
              );
            },
            separatorBuilder: (context,index){
              return const Divider(
                color: Colors.deepPurpleAccent,
              );
            },
        ),
      ),
    );
  }
}
