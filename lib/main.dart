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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          surfaceTint: Colors.white,
          brightness: Brightness.light,
        ),
      ),
    ),
  );
}
