import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/widgets/level_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareSkill extends StatelessWidget {
  const ShareSkill({super.key});

  @override
  Widget build(BuildContext context) {
    InfoController controller = Get.put(InfoController());
    return LevelScaffold(
      itemCount: 5,
      text: 'share',
      title: 'المشاركة',
      pageController: controller.pageController,
    );
  }
}
