
import '../../domain/entities/response/get_user_data_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/api/mappers/profile_user_dto_mapper.dart';

import '../models/response/get_user_data_response_dto.dart';


extension GetUserDataResponseDtoMapper on GetUserDataResponseDto {
  GetUserDataResponseEntity toEntity() {
    return GetUserDataResponseEntity(
      user:  user?.toEntity(),
      message: message ?? '',

    );
  }
}