

import '../metadata_entity.dart';
import '../subject_entity.dart';

class GetAllSubjectsResponseEntity {
  final String message;
  final MetadataEntity metadata;
  final List<SubjectEntity> subjects;

  const GetAllSubjectsResponseEntity({
    required this.message,
    required this.metadata,
    required this.subjects,
  });
}