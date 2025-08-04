import '../exam_entity.dart';
import '../metadata_entity.dart';

class GetAllExamOnSubjectEntity {
  final String? message;
  final MetadataEntity? metadata;
  final List<ExamEntity>? exams;

  GetAllExamOnSubjectEntity({
    this.message,
    this.metadata,
    this.exams,
  });
}