import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/provider/save_exam_id_provider.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_event.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_state.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_view_model.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/exam_question_content.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/exam_questions_app_bar.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/exam_questions_loading_widget.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/exam_questions_navigation_buttons.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/show_exam_score.dart';

class ExamQuestionsScreen extends StatelessWidget {
  const ExamQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = getIt.get<ExamQuestionsViewModel>();

    final examId = getIt.get<SaveExamIdProvider>().examId;
    // Load exam questions
    if (examId != null) {
      homeViewModel.doIntent(GetExamQuestionsEvent(examId: examId));
    }

    return BlocProvider.value(
      value: homeViewModel,
      child: Scaffold(
        appBar: ExamQuestionsAppBar(
          onSubmitExam: () => homeViewModel.doIntent(SubmitExamEvent()),
          homeViewModel: homeViewModel,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:
                      BlocBuilder<ExamQuestionsViewModel, ExamQuestionsState>(
                    builder: (context, state) {
                      if (state.examQuestionsIsLoading) {
                        return const ExamQuestionsLoadingWidget();
                      }

                      final questions = state.questionsList;
                      if (questions == null || questions.isEmpty) {
                        return const Center(
                          child: Text(Constants.noQuestionsAvailable),
                        );
                      }

                      if (state.isExamSubmitted) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ShowExamScore(
                                homeViewModel: homeViewModel,
                                score: state.examScore ?? 0,
                                totalQuestions: questions.length,
                              ),
                            ),
                          );
                        });
                      }

                      return ExamQuestionContent(
                        questionEntity: questions[state.currentQuestionIndex],
                        currentIndex: state.currentQuestionIndex,
                        totalQuestions: questions.length,
                        selectedAnswers: homeViewModel.getSelectedAnswerIndices(
                          questions[state.currentQuestionIndex],
                        ),
                        singleChoice: homeViewModel.isSingleChoice(
                          questions[state.currentQuestionIndex],
                        ),
                        onAnswerSelected: (answerIndex) =>
                            homeViewModel.doIntent(
                          SelectedAnswerEvent(answerIndex: answerIndex),
                        ),
                      );
                    },
                  ),
                ),
                BlocBuilder<ExamQuestionsViewModel, ExamQuestionsState>(
                  builder: (context, state) {
                    return ExamQuestionsNavigationButtons(
                      currentIndex: state.currentQuestionIndex,
                      totalQuestions: state.questionsList?.length ?? 0,
                      onPrevious: () => homeViewModel.doIntent(
                        NavigateToPreviousQuestionEvent(),
                      ),
                      onNext: () => homeViewModel.doIntent(
                        NavigateToNextQuestionEvent(),
                      ),
                      onSubmit: () => homeViewModel.doIntent(SubmitExamEvent()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } 
}
