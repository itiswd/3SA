import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillCard extends StatelessWidget {
  final String text;
  final String image;
  final Function()? onTap;
  const SkillCard({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(top: 8.0),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: (Get.width / 2) - 16,
          height: (Get.width / 2) - 16,
          child: Stack(
            children: [
              Image.asset(
                image,
                width: (Get.width / 2) - 16,
                height: (Get.width / 2) - 16,
                fit: BoxFit.fill,
              ),
              Container(
                width: (Get.width / 2) - 16,
                height: (Get.width / 2) - 16,
                color: Colors.black.withOpacity(0.3),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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
