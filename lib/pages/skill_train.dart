import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/pages/skills_training/cooperation.dart';
import 'package:sssa/pages/skills_training/empathy.dart';
import 'package:sssa/pages/skills_training/friends.dart';
import 'package:sssa/pages/skills_training/share.dart';
import 'package:sssa/pages/skills_training/wait.dart';
import 'package:sssa/widgets/skill_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsTrain extends StatelessWidget {
  const SkillsTrain({super.key});

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
          'التدريب على المهارات',
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
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                SkillCard(
                  text: 'المشاركة',
                  image: 'assets/training/share/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const ShareTrain());
                  },
                ),
                SkillCard(
                  text: 'التعاطف',
                  image: 'assets/images/empathy/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const EmpathyTrain());
                  },
                ),
                SkillCard(
                  text: 'التعاون',
                  image: 'assets/training/cooperation/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const CooperationTrain());
                  },
                ),
                SkillCard(
                  text: 'انتظار الدور',
                  image: 'assets/training/wait/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const WaitTrain());
                  },
                ),
                SkillCard(
                  text: 'تكوين الصداقات',
                  image: 'assets/training/friends/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const FriendsTrain());
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
