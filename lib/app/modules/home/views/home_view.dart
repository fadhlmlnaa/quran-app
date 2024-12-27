import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:quranku/models/surah.dart';
import 'package:quranku/utils/widget/text_widget.dart';
import '../controllers/home_controller.dart';

// Widget Statis
class StaticHeader extends StatelessWidget {
  const StaticHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFEF6C35),
        ),
        padding: const EdgeInsets.all(16),
        child: const Column(
          children: [
            TextWidget(
              text: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
              fontSize: 24,
              fontFamily: 'Lateef',
              color: Colors.white,
            ),
            SizedBox(height: 8),
            TextWidget(
              text: 'Dengan nama Allah Yang Maha Pengasih, Maha Penyayang',
              fontSize: 14,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: 'Quranku', fontSize: 16, fontWeight: FontWeight.w500,),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const StaticHeader(),
          Expanded(
            child: _buildSurahList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSurahList() {
    return FutureBuilder<List<Surah>>(
      future: controller.getAllSurah(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: TextWidget(text: 'Data Kosong'),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) =>
              _buildSurahTile(snapshot.data![index]),
        );
      },
    );
  }

  Widget _buildSurahTile(Surah surah) {
    return ListTile(
      autofocus: true,
      dense: false,
      onTap: () => Get.toNamed(Routes.DETAIL_SURAH, arguments: surah),
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFEF6C35),
        radius: 20,
        child: TextWidget(
          text: '${surah.nomor}',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: TextWidget(
        text: 'Surah ${surah.namaLatin}',
        fontWeight: FontWeight.w600,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
              text: '${surah.jumlahAyat} Ayat',
              color: Colors.black54,
              fontWeight: FontWeight.w400),
          const SizedBox(
            height: 12,
            child: VerticalDivider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          TextWidget(
              text: surah.tempatTurun,
              color: Colors.black54,
              fontWeight: FontWeight.w400)
        ],
      ),
      trailing: TextWidget(
        text: surah.nama,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }
}
