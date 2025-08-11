import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/mapper/matadata_dto_mapper.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/mapper/subject_dto_mapper.dart';
import '../../domain/entities/metadata_entity.dart';
import '../../domain/entities/response/get_all_subject_response_entity.dart';
import '../models/response/get_all_subject_response_dto.dart';

extension GetAllSubjectDtoMapper on GetAllSubjectResponseDto {
  GetAllSubjectsResponseEntity toEntity() {
    return GetAllSubjectsResponseEntity(
      message: message ?? '',
      metadata: metadata?.toEntity() ??
          const MetadataEntity(currentPage: 0, numberOfPages: 0, limit: 0),
      subjects: subjects?.map((subject) => subject.toEntity()).toList() ?? [],
    );
  }
}
