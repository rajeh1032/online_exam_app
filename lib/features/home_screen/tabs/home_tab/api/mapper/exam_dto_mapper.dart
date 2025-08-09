import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/exam_entity.dart';
import '../models/exam_dto.dart';

extension ExamsDtoMapper on ExamsDto {
  ExamEntity toEntity() {
    return ExamEntity(
      id: Id ?? '',
      title: title ?? '',
      duration: duration ?? 0,
      subject: subject ?? '',
      numberOfQuestions: numberOfQuestions ?? 0,
      active: active ?? false,
      createdAt: createdAt ?? '',
    );
  }
}
