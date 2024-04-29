import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/data/images_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelScaffold extends StatelessWidget {
  final String title;
  final PageController? pageController;
  final int itemCount;
  final String text;

  const LevelScaffold({
    super.key,
    required this.title,
    this.pageController,
    required this.itemCount,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: appbarColor,
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
        ),
        leading: const SizedBox(),
        leadingWidth: 0,
      ),
      body: Center(
        child: PageView.builder(
          itemCount: itemCount,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemBuilder: (context, index) {
            return InteractiveViewer(
              maxScale: 8.0,
              minScale: 0.5,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: (Get.height + Get.statusBarHeight + 80) / 3,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16),
                          child: Text(
                            '${index + 1}.',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 32,
                              height: 1,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                'assets/images/$text/situation_${index + 1}/main.jpg',
                                width: Get.width / 1.5,
                                height: Get.width / 1.5,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (Get.height + Get.statusBarHeight + 80) / 1.5,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                GetBuilder<InfoController>(
                                  builder: (controller) {
                                    return GestureDetector(
                                      onTap: () async {
                                        if (controller.pageController.page ==
                                            itemCount - 1) {
                                          await controller.addPoints(
                                            imgeData[text]['sit_${index + 1}']
                                                ['rate'][0],
                                          );
                                          await controller.done(
                                            text,
                                            title,
                                          );
                                        } else {
                                          await controller.addPoints(
                                            imgeData[text]['sit_${index + 1}']
                                                ['rate'][0],
                                          );
                                          controller.pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      child: Center(
                                        child: Container(
                                          width: Get.width / 2 - 12,
                                          height: Get.width / 2 - 12,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: SizedBox(
                                              child: Image.asset(
                                                imgeData[text]
                                                        ['sit_${index + 1}']
                                                    ['image'][0],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 8),
                                GetBuilder<InfoController>(
                                  builder: (controller) {
                                    return GestureDetector(
                                      onTap: () async {
                                        if (controller.pageController.page ==
                                            itemCount - 1) {
                                          await controller.addPoints(
                                            imgeData[text]['sit_${index + 1}']
                                                ['rate'][1],
                                          );
                                          await controller.done(
                                            text,
                                            title,
                                          );
                                        } else {
                                          await controller.addPoints(
                                            imgeData[text]['sit_${index + 1}']
                                                ['rate'][1],
                                          );
                                          controller.pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      child: Center(
                                        child: Container(
                                          width: Get.width / 2 - 12,
                                          height: Get.width / 2 - 12,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: SizedBox(
                                              child: Image.asset(
                                                imgeData[text]
                                                        ['sit_${index + 1}']
                                                    ['image'][1],
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GetBuilder<InfoController>(
                                  builder: (controller) {
                                    return GestureDetector(
                                      onTap: () async {
                                        if (controller.pageController.page ==
                                            itemCount - 1) {
                                          await controller.addPoints(
                                            imgeData[text]['sit_${index + 1}']
                                                ['rate'][2],
                                          );
                                          await controller.done(
                                            text,
                                            title,
                                          );
                                        } else {
                                          await controller.addPoints(
                                            imgeData[text]['sit_${index + 1}']
                                                ['rate'][2],
                                          );
                                          controller.pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: Get.width / 2 - 12,
                                        height: Get.width / 2 - 12,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        padding: const EdgeInsets.all(1),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          child: SizedBox(
                                            child: Image.asset(
                                              imgeData[text]['sit_${index + 1}']
                                                  ['image'][2],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
