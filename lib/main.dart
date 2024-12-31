import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:quranku/utils/constants/colors.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      title: 'Quranku',
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
