import 'dart:io';

import 'package:dio/dio.dart';

import '../services/retrofit_service.dart';
import 'model/UserModel/api_User_Response.dart';
import 'model/UserModel/api_add_user_details.dart';

class ApiAdapter {
  late RetrofitService _retrofitService;
  final dio = Dio();

  ApiAdapter() {
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    _retrofitService = RetrofitService(dio);
  }

  Future<UserList> getUserListResponse() {
    return _retrofitService.userList();
  }

  Future<AddUserDetails> updateUserDetails({
    required String name,
    required String address,
    required String email,
    required File profileImage,
  }) {
    return _retrofitService.updateProfile(name, address, email, profileImage);
  }
}
