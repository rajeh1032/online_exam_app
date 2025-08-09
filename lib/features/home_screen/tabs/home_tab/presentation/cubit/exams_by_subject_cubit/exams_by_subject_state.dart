import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/exam_entity.dart';

enum ExamsBySubjectStatus { initial, loading, success, error }

class ExamsBySubjectState extends Equatable {
  final List<ExamEntity> exams;
  final ExamsBySubjectStatus status;
  final String? errorMsg;

  const ExamsBySubjectState({
    this.exams = const [],
    this.status = ExamsBySubjectStatus.initial,
    this.errorMsg,
  });

  ExamsBySubjectState copyWith({
    List<ExamEntity>? exams,
    ExamsBySubjectStatus? status,
    String? errorMsg,
  }) {
    return ExamsBySubjectState(
      exams: exams ?? this.exams,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [exams, status, errorMsg];
}
