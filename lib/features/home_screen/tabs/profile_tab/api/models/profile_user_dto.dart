

import 'package:json_annotation/json_annotation.dart';
part 'profile_user_dto.g.dart';

@JsonSerializable()
class ProfileUserDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "username")
  final String? profileUserDtoName;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordResetCode")
  final String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  final String? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
  final bool? resetCodeVerified;

  ProfileUserDto ({
    this.Id,
    this.profileUserDtoName,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });

  factory ProfileUserDto.fromJson(Map<String, dynamic> json) {
    return _$ProfileUserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileUserDtoToJson(this);
  }
}