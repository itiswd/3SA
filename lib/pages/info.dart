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
                          color: itemColor,
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
                          color: itemColor,
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
                          visible: 'mimic',
                          text1: 'التقليد',
                          text2: '${prefs.getInt('mimic')} من 15',
                        ),
                        RateElement(
                          visible: 'emphathy',
                          text1: 'التعاطف',
                          text2: '${prefs.getInt('emphathy')} من 12',
                        ),
                        RateElement(
                          visible: 'self-assertion',
                          text1: 'توكيد الذات',
                          text2: '${prefs.getInt('self-assertion')} من 15',
                        ),
                        RateElement(
                          visible: 'responsibility',
                          text1: 'تحمل المسؤولية',
                          text2: '${prefs.getInt('responsibility')} من 12',
                        ),
                        RateElement(
                          visible: 'Verbal-communication',
                          text1: 'تواصل لفظي',
                          text2:
                              '${prefs.getInt('Verbal-communication')} من 15',
                        ),
                        RateElement(
                          visible: 'Non-verbal-communication',
                          text1: 'تواصل غير لفظي',
                          text2:
                              '${prefs.getInt('Non-verbal-communication')} من 12',
                        ),
                        RateElement(
                          visible: 'Restraint',
                          text1: 'ضبط النفس',
                          text2: '${prefs.getInt('Restraint')} من 12',
                        ),
                        RateElement(
                          visible: 'Safety&Security',
                          text1: 'الأمن والسلامة',
                          text2: '${prefs.getInt('Safety&Security')} من 15',
                        ),
                        RateElement(
                          visible: 'peers-connection',
                          text1: 'التواصل مع الأقران',
                          text2: '${prefs.getInt('peers-connection')} من 12',
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
