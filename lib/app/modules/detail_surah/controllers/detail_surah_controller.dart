import 'dart:convert';

import 'package:get/get.dart';
import 'package:quranku/models/detail_surah.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat/$id");
    var res = await http.get(url);
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)['data'];

  print(data);
    return DetailSurah.fromJson(data);
  }
}
