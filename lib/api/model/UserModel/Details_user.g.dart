// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Details_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsUser _$DetailsUserFromJson(Map<String, dynamic> json) => DetailsUser(
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      profilePic: json['profilepic'] as String?,
    );

Map<String, dynamic> _$DetailsUserToJson(DetailsUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'profilepic': instance.profilePic,
      'address': instance.address,
    };
