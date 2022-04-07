import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../components/app_bottom_sheet_body.dart';
import '../components/app_bottom_sheet_item.dart';
import '../components/app_textfield.dart';
import '../components/profile_picture.dart';
import '../controller/add_user_details_controller.dart';

class AddDetailsPage extends StatelessWidget {
  const AddDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    /// h and w is the responsive height and width of screen
    /// sp is the responsive font size

    /// Profile controller initialization
    final controller = Get.put(AddDetailseController());

    return WillPopScope(
      onWillPop: () {
        if (!controller.isSubmitting.value) {
          Get.back(result: true);
          return Future.value(true);
        }
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                "ADD DETAILS",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// h and w is the responsive height and width of screen

                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        showImagePickerSheet(
                            controller: controller, context: context);
                      },
                      child: Container(
                          height: 150.h,
                          width: 150.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffAEAEAE),
                              ),
                              shape: BoxShape.circle),

                          /// Profile picture widget
                          child: ProfilePicture(
                            height: 150.h,
                            width: 150.h,
                            borderRadius: 8 * 20.r,
                            onTap: () {
                              showImagePickerSheet(
                                  context: context, controller: controller);
                            },
                          )),
                    ),
                  ),

                  /// TextField widget
                  AppEditText(
                    titleText: 'Full Name',
                    hintText: 'Enter your name',
                    controller: controller.nameController,
                    keyboardType: TextInputType.name,
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  /// TextField widget
                  AppEditText(
                    titleText: 'Address',
                    hintText: 'Enter your address',
                    controller: controller.addressController,
                    keyboardType: TextInputType.name,
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  /// TextField widget
                  AppEditText(
                    titleText: 'Email',
                    hintText: 'Enter your email',
                    controller: controller.emailController,
                    keyboardType: TextInputType.name,
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  Obx(() {
                    return controller.isSubmitting.value
                        ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : RaisedButton(
                            onPressed: () {
                              controller.onSubmitButtonClicked();
                            },
                            color: Colors.black,
                            child: const Text(
                              "UPDATE",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                  })
                ],
              ),
            )),
      ),
    );
  }

  /// show imagePicker bottom sheet
  dynamic showImagePickerSheet(
      {required BuildContext context,
      required AddDetailseController controller}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetBody(
          height: 180.h,
          title: 'Select Profile Picture',
          shrinkWrap: true,
          content: ListView(
            shrinkWrap: true,
            children: [
              BottomSheetItem(
                text: 'Photo Library',
                onTap: () {
                  controller.getImagePicker(source: ImageSource.gallery);
                  Get.back();
                },
              ),
              BottomSheetItem(
                text: 'Camera',
                tileColor: Colors.white,
                onTap: () {
                  controller.getImagePicker(source: ImageSource.camera);
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
