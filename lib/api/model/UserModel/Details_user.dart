import 'package:json_annotation/json_annotation.dart';

part 'Details_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DetailsUser {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'profilepic')
  String? profilePic;

  @JsonKey(name: 'address')
  String? address;
  DetailsUser({this.name, this.email, this.address, this.profilePic});

  factory DetailsUser.fromJson(Map<String, dynamic> json) {
    return _$DetailsUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailsUserToJson(this);
}
