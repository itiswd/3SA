import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/main.dart';
import 'package:sssa/pages/info.dart';
import 'package:sssa/pages/login_screen.dart';
import 'package:sssa/pages/skill_train.dart';
import 'package:sssa/pages/skills_test.dart';
import 'package:sssa/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InfoController());
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: backColor,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () async {
            await prefs.setInt('saveLogin', 0);
            prefs.clear();
            Get.offAll(() => const LogIn());
          },
          icon: Icon(
            Icons.logout_outlined,
            color: appbarColor,
            size: 32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const Info());
            },
            icon: Icon(
              Icons.person_outline,
              color: appbarColor,
              size: 32,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          MainButton(
            width: Get.width - 128,
            height: 80,
            color: appbarColor,
            text: 'التدريب على المهارات',
            onPressed: () {
              Get.to(() => const SkillsTrain());
            },
          ),
          const SizedBox(height: 12),
          MainButton(
            width: Get.width - 128,
            height: 80,
            color: appbarColor,
            text: 'مقياس المهارات',
            onPressed: () {
              Get.to(() => const SkillsTest());
            },
          ),
          const SizedBox(height: 80),
          const Spacer(),
          GetBuilder<InfoController>(
            builder: (controller) {
              return InkWell(
                onTap: () async {
                  await controller.launchWhatsUrl(
                    'https://api.whatsapp.com/send?phone=2001070656297&text=%D8%A7%D9%84%D8%B3%D9%84%D8%A7%D9%85%20%D8%B9%D9%84%D9%8A%D9%83%D9%85%D8%8C%20%20%D9%83%D9%8A%D9%81%20%D8%A7%D9%84%D8%AD%D8%A7%D9%84!%20',
                    LaunchMode.externalApplication,
                  );
                },
                child: Text(
                  'التواصل مع المبرمج',
                  style: TextStyle(
                    fontSize: 10,
                    color: appbarColor,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
