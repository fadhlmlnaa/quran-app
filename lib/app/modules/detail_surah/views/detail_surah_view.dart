import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quranku/models/detail_surah.dart';
import 'package:quranku/models/surah.dart';
import 'package:quranku/utils/utils.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  Surah get surah => Get.arguments;
  const DetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Surah ${surah.namaLatin}'),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Card(
              color: Color(0xFFEF6C35),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: surah.namaLatin,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        TextWidget(
                          text: ' - (${surah.nama}) ',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: surah.arti,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        TextWidget(
                          text: ' | ${surah.jumlahAyat} Ayat',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    TextWidget(
                      text: surah.tempatTurun,
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: FutureBuilder<DetailSurah>(
                  future: controller.getDetailSurah(surah.nomor.toString()),
                  builder: (context, snapshot) {
                    final surahDetail = snapshot.data;
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
                      shrinkWrap: true,
                      itemCount: surah.jumlahAyat,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      child: Text('${index + 1}'),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: HeroIcon(HeroIcons.bookmark),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: HeroIcon(HeroIcons.play),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            TextWidget(
                              text: surahDetail!.ayat[index].teksArab,
                              fontSize: 28,
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
