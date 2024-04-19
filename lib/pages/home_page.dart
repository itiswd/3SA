import 'package:sssa/data/colors.dart';
import 'package:sssa/main.dart';
import 'package:sssa/pages/info.dart';
import 'package:sssa/pages/login_screen.dart';
import 'package:sssa/pages/skills_test.dart';
import 'package:sssa/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            color: itemColor,
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
              color: itemColor,
              size: 32,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainButton(
            width: Get.width - 128,
            height: 80,
            color: itemColor,
            text: 'التدريب على المهارات',
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          MainButton(
            width: Get.width - 128,
            height: 80,
            color: itemColor,
            text: 'مقياس المهارات',
            onPressed: () {
              Get.to(() => const SkillsTest());
            },
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
