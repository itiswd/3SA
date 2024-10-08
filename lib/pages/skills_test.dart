import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/pages/skills_test/cooperation.dart';
import 'package:sssa/pages/skills_test/empathy.dart';
import 'package:sssa/pages/skills_test/friends.dart';
import 'package:sssa/pages/skills_test/share.dart';
import 'package:sssa/pages/skills_test/wait.dart';
import 'package:sssa/widgets/skill_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsTest extends StatelessWidget {
  const SkillsTest({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InfoController());
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: appbarColor,
        centerTitle: true,
        title: const Text(
          'مقياس المهارات',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const SizedBox(),
        leadingWidth: 0,
      ),
      body: Center(
        child: GetBuilder<InfoController>(
          builder: (controller) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SkillCard(
                      text: 'المشاركة',
                      image: 'assets/images/share/situation_1/1.jpg',
                      onTap: () {
                        Get.to(() => const ShareSkill());
                      },
                    ),
                    SkillCard(
                      text: 'التعاطف',
                      image: 'assets/images/empathy/situation_1/1.jpg',
                      onTap: () {
                        Get.to(() => const EmpathySkill());
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SkillCard(
                      text: 'التعاون',
                      image: 'assets/images/cooperation/situation_1/1.jpg',
                      onTap: () {
                        Get.to(() => const Cooperation());
                      },
                    ),
                    SkillCard(
                      text: 'انتظار الدور',
                      image: 'assets/images/wait/situation_1/1.jpg',
                      onTap: () {
                        Get.to(() => const Wait());
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkillCard(
                      text: 'تكوين الصداقات',
                      image: 'assets/images/friends/situation_1/1.jpg',
                      onTap: () {
                        Get.to(() => const Friends());
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
