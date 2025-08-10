import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/models/profile_user_dto.dart';


part 'get_user_data_response_dto.g.dart';

@JsonSerializable()
class GetUserDataResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final ProfileUserDto? user;


  GetUserDataResponseDto ({
    this.message,
    this.user,
  });

  factory GetUserDataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetUserDataResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetUserDataResponseDtoToJson(this);
  }
}




