import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:quranku/models/surah.dart';
import 'package:quranku/utils/utils.dart';
import 'package:quranku/utils/widget/hexa_widget.dart';
import 'package:quranku/utils/widget/theme_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Quranku',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SEARCH_SURAH),
            icon: const HeroIcon(HeroIcons.magnifyingGlass),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Column(
            children: [
              TContainer(
                width: Get.width,
                borderRadius: BorderRadius.circular(12),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    borderRadius: BorderRadius.circular(12),
                    child: const Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  HeroIcon(
                                    size: 20,
                                    style: HeroIconStyle.solid,
                                    HeroIcons.bookOpen,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  TextWidget(
                                    text: 'Terakhir membaca',
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 26,
                              ),
                              TextWidget(
                                text: 'Surah Al-Fatihah',
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                              TextWidget(
                                text: 'Ayat 5',
                                fontSize: 12,
                                color: Colors.white60,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const TabBar(
                tabs: [
                  Tab(
                    text: 'Surah',
                  ),
                  Tab(
                    text: 'Bookmark',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Expanded(
                      child: _buildSurahList(),
                    ),
                    const Center(
                      child: Text('Bookmark'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () {
          return FloatingActionButton(
            onPressed: () {
              controller.toggleTheme();
            },
            child: HeroIcon(
              controller.isDarkMode.value
                  ? HeroIcons.moon
                  : HeroIcons.sun,
              style: HeroIconStyle.solid,
            ),
          );
        },
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
              _buildSurahTile(snapshot.data![index], context),
        );
      },
    );
  }

  Widget _buildSurahTile(Surah surah, BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      dense: false,
      onTap: () => Get.toNamed(Routes.DETAIL_SURAH, arguments: surah),
      leading: Stack(
        children: [
          HexagonWidget(
            size: 40,
            text: '${surah.nomor}',
          ),
        ],
      ),
      title: Text(
        surah.namaLatin,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          fontSize: 14,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
            text: '${surah.jumlahAyat} Ayat',
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 12,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          TextWidget(text: surah.tempatTurun, fontWeight: FontWeight.w400)
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
