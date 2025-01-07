import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quranku/app/data/models/surah.dart';
import 'package:quranku/app/data/models/detail_surah.dart';

void main() async {
  Uri url = Uri.parse("https://equran.id/api/v2/surat");
  var res = await http.get(url);

  // print(res.body);
  var data = (json.decode(res.body) as Map<String, dynamic>)['data'];
  // print(data[0]);

  Surah surahAnnas = Surah.fromJson(data[113]);
  // print(surahAnnas.toJson());

  Uri urlAnnas =
      Uri.parse("https://equran.id/api/v2/surat/${surahAnnas.nomor}");
  var resAnnas = await http.get(urlAnnas);
  // print(res.body);
  Map<String, dynamic> dataAnnas =
      (json.decode(resAnnas.body) as Map<String, dynamic>)['data'];
  DetailSurah annas = DetailSurah.fromJson(dataAnnas);
  print(annas.ayat[0].teksArab);
}
