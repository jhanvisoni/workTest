import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api/api_adapter.dart';
import '../api/model/UserModel/Details_user.dart';
import '../api/model/UserModel/api_User_Response.dart';
import '../screens/user_details_view.dart';

class UsersController extends GetxController {
  /// TextEditing controlllers
  final serach = TextEditingController();

  var isLoading = true.obs;
  var isSubmitting = false.obs;

  var userdataList = <DetailsUser>[].obs;
  var searchResult = <DetailsUser>[].obs;

  late UserList userData;
  final apiAdapter = ApiAdapter();

  final imagePicker = ImagePicker();
  var selectedImagePath = ''.obs;

  final client = Dio();
  late File image;
  @override
  Future<void> onInit() async {
    await getUsersData();
    super.onInit();
  }

  Widget buildSearchResults() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: searchResult.length,
      itemBuilder: (context, i) {
        return Card(
          child: ListTile(
            onTap: () {
              Get.to(const UserDetailPage(), arguments: {
                "name": searchResult[i].name!,
                "address": searchResult[i].address!,
                "email": searchResult[i].email!,
                "profilePic": searchResult[i].profilePic!
              });
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                searchResult[i].profilePic!,
              ),
            ),
            title: Text(searchResult[i].name!),
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: serach,
            decoration: const InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              serach.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    searchResult.clear();
    if (text.isEmpty) {
      update();
      return;
    }

    for (var userDetail in userdataList) {
      if (userDetail.name!.toLowerCase().contains(text)) {
        searchResult.add(userDetail);
      }
    }

    update();
  }

  ///returns User data
  Future<void> getUsersData() async {
    isLoading.value = true;
    UserList response = await apiAdapter.getUserListResponse();

    userData = response;
    isLoading.value = false;

    userdataList.assignAll(userData.data!);

    userdataList.sort((a, b) {
      return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
    });

    update();
  }
}
