import 'dart:convert';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quranku/models/detail_surah.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  final player = AudioPlayer();
  final playerFull = AudioPlayer();
  var playingAyatIndex = (-1).obs;
  final isPlaying = false.obs;
  final isPlayingFull = false.obs;
  final position = Rx<Duration>(Duration.zero);
  final duration = Rx<Duration>(Duration.zero);

  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://equran.id/api/v2/surat/$id");
    var res = await http.get(url);
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)['data'];

    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    print(encoder.convert(data));

    return DetailSurah.fromJson(data);
  }

  Future<void> playAudio(String? url, int index) async {
    if (url != null) {
      try {
        if (isPlayingFull.value) {
          await stopAudioFull();
        }
        isPlaying.value = true;
        playingAyatIndex.value = index;
        await player.setUrl(url);
        await player.play();
        player.playerStateStream.listen(
          (state) {
            if (state.processingState == ProcessingState.completed) {
              isPlaying.value = false;
            } else {
              isPlaying.value = true;
            }
          },
        );
      } catch (e) {
        print('An error occurred: $e');
        isPlaying.value = false;
      }
    } else {
      isPlaying.value = false;
      Get.snackbar('Error', 'Audio not found');
    }
  }

  Future<void> playAudioFull(String? url) async {
    if (url != null) {
      try {
        isPlayingFull.value = true;
        await playerFull.setUrl(url);
        await playerFull.play();

        playerFull.positionStream.listen((pos) {
          position.value = pos;
        });

        playerFull.durationStream.listen((dur) {
          duration.value = dur ?? Duration.zero;
        });

        playerFull.playerStateStream.listen((state) {
          if (state.processingState == ProcessingState.completed) {
            isPlayingFull.value = false;
          } else {
            isPlayingFull.value = true;
          }
        });
      } catch (e) {
        print('An error occurred: $e');
        isPlayingFull.value = false;
      }
    } else {
      isPlayingFull.value = false;
      Get.snackbar('Error', 'Audio not found');
    }
  }

  Future<void> pauseAudio() async {
    await player.pause();
    isPlaying.value = false;
  }

  Future<void> pauseAudioFull() async {
    await playerFull.pause();
    isPlayingFull.value = false;
  }

  Future<void> stopAudioFull() async {
    await playerFull.stop();
    await playerFull.seek(Duration.zero);
    isPlayingFull.value = false;
    position.value = Duration.zero;
  }


  Future<void> handleSeekFull(double value) async {
    await playerFull.seek(Duration(seconds: value.toInt()));
  }

  @override
  void onClose() {
    player.stop();
    playerFull.stop();
    player.dispose();
    playerFull.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    playerFull.positionStream.listen((pos) {
      position.value = pos;
    });
    playerFull.durationStream.listen((dur) {
      duration.value = dur ?? Duration.zero;
    });
  }
}
