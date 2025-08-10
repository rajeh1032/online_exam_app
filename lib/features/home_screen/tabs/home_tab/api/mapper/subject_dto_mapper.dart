import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/subject_entity.dart';

import '../models/subject_dto.dart';

extension SubjectsDtoMapper on SubjectsDto {
  SubjectEntity toEntity() {
    return SubjectEntity(
      id: Id ?? '',
      name: name ?? '',
      icon: icon ?? '',
    );
  }
}