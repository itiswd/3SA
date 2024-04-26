import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/widgets/level_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sssa/widgets/train_scaffold.dart';

class CooperationTrain extends StatelessWidget {
  const CooperationTrain({super.key});

  @override
  Widget build(BuildContext context) {
    InfoController controller = Get.put(InfoController());
    return TrainScaffold(
      itemCount: 2,
      text: 'cooperation',
      title: 'التعاون',
      pageController: controller.pageController,
    );
  }
}
