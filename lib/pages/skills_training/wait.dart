import 'package:sssa/controller/info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sssa/widgets/train_scaffold.dart';

class WaitTrain extends StatelessWidget {
  const WaitTrain({super.key});

  @override
  Widget build(BuildContext context) {
    InfoController controller = Get.put(InfoController());
    return TrainScaffold(
      itemCount: 1,
      text: 'wait',
      title: 'انتظار الدور',
      pageController: controller.pageController,
    );
  }
}
