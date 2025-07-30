import 'package:flutter/material.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/questions_widget.dart';

class ExamQuestionContent extends StatelessWidget {
  final QuestionsEntity questionEntity;
  final int currentIndex;
  final int totalQuestions;
  final List<int> selectedAnswers;
  final bool singleChoice;
  final ValueChanged<int> onAnswerSelected;

  ExamQuestionContent(
      {super.key,
      required this.questionEntity,
      required this.currentIndex,
      required this.totalQuestions,
      required this.selectedAnswers,
      required this.singleChoice,
      required this.onAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return QuestionsWidget(
        currentIndex: currentIndex,
        totalQuestions: totalQuestions,
        questionEntity: questionEntity,
        selectedAnswers: selectedAnswers,
        singleChoice: singleChoice,
        onAnswerSelected: onAnswerSelected);
  }
}
