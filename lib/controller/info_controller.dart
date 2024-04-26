import 'package:sssa/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoController extends GetxController {
  int tempNum = 0;
  PageController pageController = PageController();

  //Add point
  Future<void> addPoints(int num) async {
    prefs = await SharedPreferences.getInstance();
    tempNum += num;
    await prefs.setInt('temp', tempNum);
    //Test results
    // debugPrint('$tempNum');
  }

  //Calculate result
  Future<void> done(String keyy, String text) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setInt(keyy, prefs.getInt('temp')!);
    await prefs.setInt('temp', 0);
    tempNum = 0;
    prefs.setInt('vis$keyy', 1);
    Get.back();
    Get.defaultDialog(
      titleStyle: const TextStyle(
        color: Colors.red,
      ),
      title: 'تم الانتهاء بنجاح🥰',
      middleText: 'تم الاختبار في مهارة $text',
    );
    //Test results
    // debugPrint('${prefs.getInt('temp')}');
    // debugPrint('${prefs.getInt(keyy)}');
  }

  //Train singl result
}
