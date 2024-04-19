import 'dart:convert';
import 'package:sssa/main.dart';
import 'package:sssa/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  String? imageBase64;
  //Login
  Future<void> logIn() async {
    if (nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        selectedGender != 'النوع') {
      saveData();
      Get.off(() => const HomePage());
    } else {
      Get.defaultDialog(
        titleStyle: const TextStyle(
          color: Colors.red,
        ),
        title: 'خطأ',
        middleText: 'يجب اكمال البيانات!',
      );
    }
  }

  //Save Login Data
  Future<void> saveData() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('age', ageController.text);
    await prefs.setString('gender', selectedGender!);
    await prefs.setInt('saveLogin', 1);
  }

  //Pick Image
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      final String base64Image = base64Encode(bytes);
      prefs = await SharedPreferences.getInstance();
      await prefs.setString('cached_image', base64Image);
      imageBase64 = base64Image;
      update();
    }
  }

  //Load Image
  Future<void> loadImage() async {
    prefs = await SharedPreferences.getInstance();
    imageBase64 = prefs.getString('cached_image');
    update();
  }

  //Gender
  String? selectedGender = 'النوع';
  List<String> genderOptions = ['ولد', 'بنت'];

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    loadImage();
    super.onInit();
  }
}
