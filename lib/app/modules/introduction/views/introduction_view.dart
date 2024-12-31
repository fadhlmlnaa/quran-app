import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:quranku/utils/utils.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                text: 'Quranku',
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              const TextWidget(
                align: TextAlign.center,
                text:
                    'Sesibuk itukah dengan dunia? biasakan membaca Al Qur\'an',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                child: Lottie.asset(
                  Images.get.loIntro,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Get.offAllNamed(Routes.HOME),
                child: const TextWidget(
                  text: 'Mulai Membaca',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
