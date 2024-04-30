import 'package:sssa/controller/info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sssa/widgets/train_scaffold.dart';

class FriendsTrain extends StatelessWidget {
  const FriendsTrain({super.key});

  @override
  Widget build(BuildContext context) {
    InfoController controller = Get.put(InfoController());
    return TrainScaffold(
      itemCount: 2,
      text: 'friends',
      title: 'تكوين الصداقات',
      pageController: controller.pageController,
    );
  }
}
