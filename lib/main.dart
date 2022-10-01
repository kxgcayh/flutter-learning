import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      supportedLocales: [
        Locale('id', 'ID'),
        Locale('en', 'EN'),
      ],
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
    ),
  );
}
