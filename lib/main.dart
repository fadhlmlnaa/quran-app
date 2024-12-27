import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranku/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Quranku',
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.light(
          surfaceTint: Colors.white,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFFEF6C35),
        ),
      ),
    ),
  );
}
