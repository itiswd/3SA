import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/pages/skills_test/empathy.dart';
import 'package:sssa/pages/skills_test/mimic.dart';
import 'package:sssa/pages/skills_test/non_verbal_comm.dart';
import 'package:sssa/pages/skills_test/peers_connection.dart';
import 'package:sssa/pages/skills_test/resposibility.dart';
import 'package:sssa/pages/skills_test/restraint.dart';
import 'package:sssa/pages/skills_test/safety_and_security.dart';
import 'package:sssa/pages/skills_test/self_assertion.dart';
import 'package:sssa/pages/skills_test/share.dart';
import 'package:sssa/pages/skills_test/verbal_comm.dart';
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
        backgroundColor: itemColor,
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
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                SkillCard(
                  text: 'المشاركة',
                  image: 'assets/images/share/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const ShareSkill());
                  },
                ),
                SkillCard(
                  text: 'التقليد',
                  image: 'assets/images/mimic/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const MimicSkill());
                  },
                ),
                SkillCard(
                  text: 'التعاطف',
                  image: 'assets/images/emphathy/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const EmphathySkill());
                  },
                ),
                SkillCard(
                  text: 'توكيد الذات',
                  image: 'assets/images/self-assertion/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const SelfAssertionSkill());
                  },
                ),
                SkillCard(
                  text: 'تحمل المسؤولية',
                  image: 'assets/images/responsibility/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const ResponsibilitySkill());
                  },
                ),
                SkillCard(
                  text: 'تواصل لفظي',
                  image: 'assets/images/Verbal-communication/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const VerbalCommunication());
                  },
                ),
                SkillCard(
                  text: 'تواصل غير لفظي',
                  image:
                      'assets/images/Non-verbal-communication/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const NonVerbalCommunication());
                  },
                ),
                SkillCard(
                  text: 'ضبط النفس',
                  image: 'assets/images/Restraint/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const Restraint());
                  },
                ),
                SkillCard(
                  text: 'الأمن والسلامة',
                  image: 'assets/images/Safety&Security/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const SafetyAndSecurity());
                  },
                ),
                SkillCard(
                  text: 'التواصل مع الأقران',
                  image: 'assets/images/peers-connection/situation_1/1.jpg',
                  onTap: () {
                    Get.to(() => const PeersConnection());
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
