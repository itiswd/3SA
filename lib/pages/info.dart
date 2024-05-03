import 'package:sssa/controller/info_controller.dart';
import 'package:sssa/controller/login_controller.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/main.dart';
import 'package:sssa/widgets/rate_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(InfoController());
    return Scaffold(
      backgroundColor: backColor,
      body: Center(
        child: Column(
          children: [
            //Welcome and age
            SizedBox(
              height: 160,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 72.0),
                      child: Text(
                        'اهلاً ${prefs.getString('name')}!',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: appbarColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: Text(
                              'العمر : ${prefs.getString('age')}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          color: appbarColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: Text(
                              'النوع : ${prefs.getString('gender')}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Scores
            SizedBox(
              height: Get.height - 160,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                      right: 4.0,
                      left: 4.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RateElement(
                          visible: 'share',
                          text1: 'المشاركة',
                          text2: '${prefs.getInt('share')} من 15',
                        ),
                        RateElement(
                          visible: 'empathy',
                          text1: 'التعاطف',
                          text2: '${prefs.getInt('empathy')} من 12',
                        ),
                        RateElement(
                          visible: 'cooperation',
                          text1: 'التعاون',
                          text2: '${prefs.getInt('cooperation')} من 15',
                        ),
                        RateElement(
                          visible: 'wait',
                          text1: 'انتظار الدور',
                          text2: '${prefs.getInt('wait')} من 15',
                        ),
                        RateElement(
                          visible: 'friends',
                          text1: 'تكوين الصداقات',
                          text2: '${prefs.getInt('friends')} من 15',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
