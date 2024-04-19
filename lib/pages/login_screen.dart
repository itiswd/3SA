import 'package:sssa/controller/login_controller.dart';
import 'package:sssa/data/colors.dart';
import 'package:sssa/widgets/main_button.dart';
import 'package:sssa/widgets/main_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: backColor,
      body: Center(
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              SizedBox(height: Get.width / 2),
              //Image
              // GetBuilder<LoginController>(
              //   builder: (controller) {
              //     return controller.imageBase64 == null
              //         ? InkWell(
              //             onTap: () async {
              //               await controller.pickImage();
              //             },
              //             child: Image.asset(
              //               'assets/images/image-gallery.png',
              //               width: 160,
              //               height: 160,
              //             ),
              //           )
              //         : Center(
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(160),
              //               child: Image.memory(
              //                 base64Decode(controller.imageBase64!),
              //                 width: Get.width / 3,
              //                 height: Get.width / 3,
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           );
              //   },
              // ),
              const SizedBox(height: 24),
              MainTextFormField(
                labelText: 'الاسم',
                controller: controller.nameController,
              ),
              MainTextFormField(
                labelText: 'العمر',
                controller: controller.ageController,
              ),
              GetBuilder<LoginController>(
                builder: (controller) {
                  return PopupMenuButton<String>(
                    color: appbarColor,
                    position: PopupMenuPosition.under,
                    child: Card(
                      color: appbarColor,
                      surfaceTintColor: appbarColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(48),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 20),
                        child: Text(
                          controller.selectedGender!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    onSelected: (value) {
                      controller.selectedGender = value;
                      controller.update();
                    },
                    itemBuilder: (BuildContext context) {
                      return controller.genderOptions.map((String gender) {
                        return PopupMenuItem<String>(
                          labelTextStyle: MaterialStateProperty.all(
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'HONOR',
                            ),
                          ),
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList();
                    },
                  );
                },
              ),
              const SizedBox(height: 4),
              MainButton(
                width: Get.width - 128,
                height: 64,
                color: itemColor,
                text: 'تسجيل دخول',
                onPressed: () {
                  controller.logIn();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
