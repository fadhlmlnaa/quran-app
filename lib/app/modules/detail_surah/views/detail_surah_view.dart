import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quranku/models/detail_surah.dart';
import 'package:quranku/models/surah.dart';
import 'package:quranku/utils/utils.dart';
import 'package:quranku/utils/widget/hexa_widget.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  Surah get surah => Get.arguments;
  const DetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Surah ${surah.namaLatin}',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
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
                  return Column(
                    children: [
                      Card(
                        borderOnForeground: true,
                        color: Theme.of(context).brightness == Brightness.light
                            ? primaryColor
                            : secondaryColor,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 18,
                                ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () {
                                    final currentPosition = controller
                                        .position.value.inSeconds
                                        .toDouble();
                                    final maxDuration = controller
                                        .duration.value.inSeconds
                                        .toDouble();
                                    return SizedBox(
                                      width: Get.width * 0.7,
                                      child: Slider(
                                        value: currentPosition,
                                        max: maxDuration,
                                        min: 0,
                                        onChanged: (value) {
                                          controller.handleSeekFull(value);
                                        },
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (controller.isPlayingFull.value) {
                                      controller.pauseAudioFull();
                                    } else {
                                      final audioUrl = surahDetail!
                                          .audioFull.values
                                          .elementAt(3);
                                      controller.playAudioFull(audioUrl);
                                    }
                                  },
                                  icon: Obx(
                                    () => HeroIcon(
                                      controller.isPlayingFull.value
                                          ? HeroIcons.pause
                                          : HeroIcons.play,
                                      style: HeroIconStyle.solid,
                                      size: 20,
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.white
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: surahDetail!.jumlahAyat,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final Ayat ayatSurah = surahDetail.ayat[index];
                          return Column(
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          HexagonWidget(
                                            text: (index + 1).toString(),
                                            size: 35,
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: HeroIcon(
                                                  HeroIcons.bookmark,
                                                  size: 20,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? primaryColor
                                                      : secondaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  if (controller
                                                      .isPlaying.value) {
                                                    controller.pauseAudio();
                                                  } else {
                                                    final audioUrl = ayatSurah
                                                        .audio.values
                                                        .elementAt(3);
                                                    controller.playAudio(
                                                        audioUrl, index);
                                                  }
                                                },
                                                icon: Obx(
                                                  () => HeroIcon(
                                                    controller.playingAyatIndex
                                                                    .value ==
                                                                index &&
                                                            controller
                                                                .isPlaying.value
                                                        ? HeroIcons.pause
                                                        : HeroIcons.play,
                                                    style: HeroIconStyle.solid,
                                                    size: 20,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? primaryColor
                                                        : secondaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            ayatSurah.teksArab,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontFamily: 'Lateef',
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ayatSurah.teksLatin,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? const Color(0xFF61677A)
                                                    : const Color(0xFFC6C6C6),
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            TextWidget(
                                              text: ayatSurah.teksIndonesia,
                                              align: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
