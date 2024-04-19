import 'package:sssa/data/colors.dart';
import 'package:sssa/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateElement extends StatelessWidget {
  final String text1;
  final String text2;
  final String visible;
  const RateElement({
    super.key,
    required this.text1,
    required this.text2,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: prefs.getInt(visible) == 0 || prefs.getInt(visible) == null
          ? false
          : true,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4.0),
        width: Get.width - 32,
        height: 56,
        decoration: BoxDecoration(
          color: appbarColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Card(
                  color: itemColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 6.0,
                    ),
                    child: Text(
                      text1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Card(
                  color: itemColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 6.0,
                    ),
                    child: Text(
                      text2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
