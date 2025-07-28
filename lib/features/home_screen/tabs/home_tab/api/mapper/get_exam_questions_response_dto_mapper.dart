import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/models/response/get_exam_questions_response_dto.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';

extension GetExamQuestionsResponseDtoMapper on ExamResponseDto {
  GetExamQuestionsResponseEntity toEntity() {
    return GetExamQuestionsResponseEntity(
      message: message,
      questions: questions?.map((e) => e.toEntity()).toList(),
    );
  }
}

extension QuestionsDtoMapper on Questions {
  QuestionsEntity toEntity() {
    return QuestionsEntity(
      id: id,
      question: question,
      answers: answers?.map((e) => e.toEntity()).toList(),
      type: type,
      correct: correct,
      subject: subject?.toEntity(),
      exam: exam?.toEntity(),
      createdAt: createdAt,
    );
  }
}

extension AnswersDtoMapper on Answers {
  AnswersEntity toEntity() {
    return AnswersEntity(
      answer: answer,
      key: key,
    );
  }
}

extension SubjectDtoMapper on Subject {
  SubjectEntity toEntity() {
    return SubjectEntity(
      id: id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}

extension ExamDtoMapper on Exam {
  ExamEntity toEntity() {
    return ExamEntity(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      createdAt: createdAt,
    );
  }
}
