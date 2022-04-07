import 'package:json_annotation/json_annotation.dart';

import 'Details_user.dart';

part 'api_add_user_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AddUserDetails {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  dynamic message;

  @JsonKey(name: 'data')
  DetailsUser? data;

  AddUserDetails({this.status, this.data});

  factory AddUserDetails.fromJson(Map<String, dynamic> json) {
    return _$AddUserDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddUserDetailsToJson(this);
}
