import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_event.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_state.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_view_model.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/exam_question_content.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/exam_questions_app_bar.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/exam_questions_loading_widget.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/exam_questions_navigation_buttons.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/exam_question/show_exam_score.dart';

class ExamQuestionsScreen extends StatefulWidget {
  final String examId;
  ExamQuestionsScreen({
    super.key,
    required this.examId,
  });

  @override
  State<ExamQuestionsScreen> createState() => _ExamQuestionScreenState();
}

class _ExamQuestionScreenState extends State<ExamQuestionsScreen> {
  late final ExamQuestionsViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = getIt.get<ExamQuestionsViewModel>();
    _loadExamQuestions();
  }

  void _loadExamQuestions() {
    _homeViewModel.doIntent(GetExamQuestionsEvent(examId: widget.examId));
  }

  void _handleExamSubmission() {
    _homeViewModel.doIntent(SubmitExamEvent());
  }

  void _handleAnswerSelection(int answerIndex) {
    _homeViewModel.doIntent(SelectedAnswerEvent(answerIndex: answerIndex));
  }

  void _handlePreviousQuestion() {
    _homeViewModel.doIntent(NavigateToPreviousQuestionEvent());
  }

  void _handleNextQuestion() {
    _homeViewModel.doIntent(NavigateToNextQuestionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeViewModel,
      child: Scaffold(
        appBar: ExamQuestionsAppBar(
          onSubmitExam: _handleExamSubmission,
          homeViewModel: _homeViewModel,
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
                                homeViewModel: _homeViewModel,
                                score: state.examScore ?? 0,
                                totalQuestions: questions.length ?? 0,
                              ),
                            ),
                          );
                        });
                      }

                      return ExamQuestionContent(
                        questionEntity: questions[state.currentQuestionIndex],
                        currentIndex: state.currentQuestionIndex,
                        totalQuestions: questions.length,
                        selectedAnswers:
                            _homeViewModel.getSelectedAnswerIndices(
                          questions[state.currentQuestionIndex],
                        ),
                        singleChoice: _homeViewModel.isSingleChoice(
                          questions[state.currentQuestionIndex],
                        ),
                        onAnswerSelected: _handleAnswerSelection,
                      );
                    },
                  ),
                ),
                BlocBuilder<ExamQuestionsViewModel, ExamQuestionsState>(
                  builder: (context, state) {
                    return ExamQuestionsNavigationButtons(
                      currentIndex: state.currentQuestionIndex,
                      totalQuestions: state.questionsList?.length ?? 0,
                      onPrevious: _handlePreviousQuestion,
                      onNext: _handleNextQuestion,
                      onSubmit: _handleExamSubmission,
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
