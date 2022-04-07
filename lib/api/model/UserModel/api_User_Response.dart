import 'package:json_annotation/json_annotation.dart';

import 'Details_user.dart';

part 'api_User_Response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserList {
  @JsonKey(name: 'data')
  List<DetailsUser>? data;

  UserList({this.data});

  factory UserList.fromJson(Map<String, dynamic> json) {
    return _$UserListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserListToJson(this);
}
