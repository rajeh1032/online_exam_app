


import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/mappers/profile_user_dto_mapper.dart';

import '../../domain/entities/response/edit_profile_response_entity.dart';
import '../models/response/edit_profile_response_dto.dart';

extension EditProfileResponseDtoMapper on EditProfileResponseDto {
  EditProfileResponseEntity toEntity() {
    return EditProfileResponseEntity(
   user:  user?.toEntity(),
      message: message ?? '',
    );
  }
}