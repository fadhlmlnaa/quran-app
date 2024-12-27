import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:quranku/models/surah.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quranku'),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: FutureBuilder<List<Surah>>(
            future: controller.getAllSurah(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text('Data Kosong'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final surah = snapshot.data![index];
                  return ListTile(
                    tileColor: Colors.white,
                    hoverColor: Colors.white,
                    dense: true,
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
                    },
                    leading: CircleAvatar(
                      child: Text('${surah.nomor}'),
                    ),
                    title: Text('Surah ${surah.namaLatin}'),
                    subtitle:
                        Text('${surah.jumlahAyat} Ayat | ${surah.tempatTurun}'),
                    trailing: Text('${surah.nama}'),
                  );
                },
              );
            }));
  }
}
