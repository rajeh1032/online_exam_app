class GetExamQuestionsResponseEntity {
  GetExamQuestionsResponseEntity({
    this.message,
    this.questions,
  });

  String? message;
  List<QuestionsEntity>? questions;
}

class QuestionsEntity {
  QuestionsEntity({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  String? id;
  String? question;
  List<AnswersEntity>? answers;
  String? type;
  String? correct;
  SubjectEntity? subject;
  ExamEntity? exam;
  String? createdAt;
}

class ExamEntity {
  ExamEntity({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  String? id;
  String? title;
  num? duration;
  String? subject;
  num? numberOfQuestions;
  bool? active;
  String? createdAt;
}

class SubjectEntity {
  SubjectEntity({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  String? id;
  String? name;
  String? icon;
  String? createdAt;
}

class AnswersEntity {
  AnswersEntity({
    this.answer,
    this.key,
  });

  String? answer;
  String? key;
}
