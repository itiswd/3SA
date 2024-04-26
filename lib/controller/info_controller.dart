import 'package:audioplayers/audioplayers.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoController extends GetxController {
  int tempNum = 0;
  PageController pageController = PageController();
  int arrowColor = 0;
  final palyResult = AudioPlayer();
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
  Future<void> trainResult(String text, int rate) async {
    Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 12.0),
      title: text,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              color: appbarColor,
              onPressed: () {
                Get.back();
              },
              icon: const Text(
                'إعادة المحاولة',
              ),
            ),
            Card(
              color: itemColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                  Get.back();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'التالي',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )
      ],
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.ltr,
            children: [
              Icon(
                Icons.star,
                color: rate <= 0 ? Colors.black12 : Colors.amber,
                size: 40,
              ),
              Icon(
                Icons.star,
                color: rate <= 1 ? Colors.black12 : Colors.amber,
                size: 48,
              ),
              Icon(
                Icons.star,
                color: rate <= 2 ? Colors.black12 : Colors.amber,
                size: 56,
              ),
            ],
          )
        ],
      ),
    );
    if (rate == 3) {
      palyResult.play(AssetSource("sounds/correct3.mp3"));
    } else if (rate == 2) {
      palyResult.play(AssetSource("sounds/correct2.mp3"));
    } else if (rate == 1) {
      palyResult.play(AssetSource("sounds/correct1.mp3"));
    } else {
      palyResult.play(AssetSource("sounds/wrong.mp3"));
    }
  }
}
