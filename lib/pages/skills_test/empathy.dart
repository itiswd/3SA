import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/widgets/level_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmpathySkill extends StatelessWidget {
  const EmpathySkill({super.key});

  @override
  Widget build(BuildContext context) {
    InfoController controller = Get.put(InfoController());
    return LevelScaffold(
      itemCount: 4,
      text: 'empathy',
      title: 'التعاطف',
      pageController: controller.pageController,
    );
  }
}
