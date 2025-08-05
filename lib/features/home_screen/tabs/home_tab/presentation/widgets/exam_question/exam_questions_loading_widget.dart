import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/questions_widget.dart';

class ExamQuestionsLoadingWidget extends StatelessWidget {
  const ExamQuestionsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fakeQuestion = QuestionsEntity(
        question: Constants.loadingQuestion,
        answers: List.generate(
            4, (i) => AnswersEntity(answer: Constants.loadingAnswer)));

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: QuestionsWidget(
        questionEntity: fakeQuestion,
        currentIndex: 0,
        totalQuestions: 10,
        selectedAnswers: const [],
        singleChoice: true,
        onAnswerSelected: (_) {},
      ),
    );
  }
}
