// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_add_user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserDetails _$AddUserDetailsFromJson(Map<String, dynamic> json) =>
    AddUserDetails(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : DetailsUser.fromJson(json['data'] as Map<String, dynamic>),
    )..message = json['message'];

Map<String, dynamic> _$AddUserDetailsToJson(AddUserDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
