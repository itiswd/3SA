import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/data/images_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainScaffold extends StatelessWidget {
  final String title;
  final PageController? pageController;
  final int itemCount;
  final String text;

  const TrainScaffold({
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
                    height: (Get.height + Get.statusBarHeight + 80) / 2,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, bottom: 64),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              padding: const EdgeInsets.all(12),
                              onPressed: () {
                                pageController!.previousPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut);
                              },
                              icon: const Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  textDirection: TextDirection.ltr,
                                  Icons.arrow_forward_ios,
                                  size: 40,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  'assets/training/$text/situation_${index + 1}/main.jpg',
                                  width: Get.width / 1.5,
                                  height: Get.width / 1.5,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(12),
                              onPressed: () {
                                pageController!.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut);
                              },
                              icon: const Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  textDirection: TextDirection.rtl,
                                  Icons.arrow_forward_ios,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: (Get.height + Get.statusBarHeight + 80) / 3,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: GridView.builder(
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(0.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemBuilder: (context, gridIndex) {
                          return GetBuilder<InfoController>(
                            builder: (controller) {
                              return GestureDetector(
                                onTap: () async {
                                  controller.trainResult(
                                      title,
                                      trainImage[text]['sit_${index + 1}']
                                          ['rate'][gridIndex]);
                                },
                                child: Center(
                                  child: Row(
                                    children: [
                                      Container(
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
                                              trainImage[text]
                                                      ['sit_${index + 1}']
                                                  ['image'][gridIndex],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
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
