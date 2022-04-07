// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_User_Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserList _$UserListFromJson(Map<String, dynamic> json) => UserList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DetailsUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserListToJson(UserList instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
