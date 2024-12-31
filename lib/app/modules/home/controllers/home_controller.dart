import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quranku/models/surah.dart';

class HomeController extends GetxController {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat");
    var res = await http.get(url);
    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    print(encoder.convert(data));
    
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }


  var isDarkMode = Get.isDarkMode.obs;
  void toggleTheme() {
    if (isDarkMode.value) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
    isDarkMode.value = !isDarkMode.value;
  }
}
