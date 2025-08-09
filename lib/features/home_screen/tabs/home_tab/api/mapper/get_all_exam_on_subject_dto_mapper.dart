

import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/mapper/exam_dto_mapper.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/mapper/matadata_dto_mapper.dart';

import '../../domain/entities/response/get_all_exam_on_subject_entity.dart';
import '../models/response/get_all_exam_on_subject_response_dto.dart';

extension GetAllExamOnSubjectDtoMapper on GetAllExamOnSubjectDto {
  GetAllExamOnSubjectEntity toEntity() {
    return GetAllExamOnSubjectEntity(
      message: message ?? '',
      metadata: metadata?.toEntity(),
      exams: exams?.map((e) => e.toEntity()).toList(),
    );
  }
}
