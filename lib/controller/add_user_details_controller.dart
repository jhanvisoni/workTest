import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:worktask/controller/user_list_controller.dart';

import '../api/api_adapter.dart';
import '../api/model/UserModel/api_add_user_details.dart';
import '../components/app_dialog.dart';
import '../screens/public_lists.dart';

class AddDetailseController extends GetxController {
  /// TextEditing controlllers
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final listController = Get.find<UsersController>();
  var selectedState = ''.obs;
  var selectedCity = ''.obs;
  var profilePic = ''.obs;

  var isLoading = true.obs;
  var isSubmitting = false.obs;

  // late DetailsUSER userData;
  final apiAdapter = ApiAdapter();

  final imagePicker = ImagePicker();
  var selectedImagePath = ''.obs;

  final client = Dio();
  late File image;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  /// Pick Image from camera and gallery method
  Future<void> getImagePicker({required ImageSource source}) async {
    var pickedFile =
        await imagePicker.getImage(source: source, imageQuality: 50);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }

  /// on submit data method
  Future<void> onSubmitButtonClicked() async {
    var selectedImage = selectedImagePath.value;
    var file = File(selectedImage);

    if (nameController.text.isEmpty) {
      return AppDialog.showMeassageDialog(title: 'Please enter name');
    }
    if (addressController.text.isEmpty) {
      return AppDialog.showMeassageDialog(title: 'Please enter address');
    }

    if (emailController.text.isEmpty) {
      return AppDialog.showMeassageDialog(title: 'Please enter email');
    }

    if (!emailController.text.isEmail) {
      return AppDialog.showMeassageDialog(title: 'Please enter valid email');
    }

    if (selectedImagePath.value.isEmpty) {
      return AppDialog.showMeassageDialog(title: 'Please add picture');
    }

    isSubmitting.value = true;
    late AddUserDetails response; // this is the correct way of doing this.

    response = await _updateProfile(
        name: nameController.text,
        address: addressController.text,
        email: emailController.text,
        profileImage: file);
    isSubmitting.value = false;

    AppDialog.showMeassageDialog(
      description: response.message!,
      onPressed: () async {
        Get.back();
        await listController.getUsersData();
        Get.to(UsersList());
      },
      buttonText: 'Okay',
    );
    nameController.text = '';
    addressController.text = '';
    emailController.text = '';
    selectedImagePath.value = '';
  }

  /// private methods
  Future<AddUserDetails> _updateProfile({
    required String name,
    required String address,
    required String email,
    required File profileImage,
  }) async {
    late AddUserDetails response;
    try {
      response = await apiAdapter.updateUserDetails(
          name: name,
          address: address,
          email: email,
          profileImage: profileImage);
    } on DioError catch (e) {
      log(e.message);
    }
    return response;
  }
}
