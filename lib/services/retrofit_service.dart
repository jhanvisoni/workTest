import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../api/model/UserModel/api_User_Response.dart';
import '../api/model/UserModel/api_add_user_details.dart';
import '../constants/app_constants.dart';
import '../constants/endpoint.dart';

part 'retrofit_service.g.dart';

@RestApi(baseUrl: baseUrl) // dev
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String baseUrl}) = _RetrofitService;

  /// returns user details
  @FormUrlEncoded()
  @GET(epGetUserLists)
  Future<UserList> userList();

  /// update user data with profile picture using multipart
  @POST(epUpdateUserDetails)
  @MultiPart()
  Future<AddUserDetails> updateProfile(
    @Part(name: 'name') String? name,
    @Part(name: 'address') String? cityName,
    @Part(name: 'email') String? cityId,
    @Part(name: 'profilepic') File profileImage,
  );
}
