import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/models/profile_user_dto.dart';



part 'edit_profile_response_dto.g.dart';

@JsonSerializable()
class EditProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final ProfileUserDto? user;

  EditProfileResponseDto({this.message, this.user});

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileResponseDtoToJson(this);
  }


}