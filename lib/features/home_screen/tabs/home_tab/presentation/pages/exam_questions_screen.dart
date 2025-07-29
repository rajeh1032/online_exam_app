import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/assets/app_assets.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_event.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_state.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_view_model.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/questions_widget.dart';
import 'package:shimmer/shimmer.dart';

class ExamQuestionScreen extends StatefulWidget {
  const ExamQuestionScreen({super.key});

  @override
  State<ExamQuestionScreen> createState() => _ExamQuestionScreenState();
}

class _ExamQuestionScreenState extends State<ExamQuestionScreen> {
  List<int> selectedAnswers = [];
  int currentIndex = 0;
  bool singleChoice = true;

  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();
  void selectAnswer(int index) {
    setState(() {
      if (singleChoice) {
        selectedAnswers = [index];
      } else {
        if (selectedAnswers.contains(index)) {
          selectedAnswers.remove(index);
        } else {
          selectedAnswers.add(index);
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel
        .doIntent(GetExamQuestionsEvent(examId: "6700708d30a3c3c1944a9c60"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
          appBar: getAppBar(context: context),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<HomeViewModel, HomeState>(
                    builder: (context, state) {
                      final questions = state.questionsList;
                      if (state.examQuestionsIsLoading) {
                        final fakeQuestion = QuestionsEntity(
                          question: Constants.loadingQuestion,
                          answers: List.generate(
                            4,
                            (i) => AnswersEntity(
                              answer: Constants.loadingAnswer,
                            ),
                          ),
                        );

                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: QuestionsWidget(
                            questionEntity: fakeQuestion,
                            currentIndex: 1,
                            totalQuestions: 10,
                            selectedAnswers: [],
                            singleChoice: true,
                            onAnswerSelected: (_) {},
                          ),
                        );
                      }
                      if (questions == null || questions.isEmpty) {
                        return const Center(
                            child: Text(Constants.noQuestionsAvailable));
                      }

                      final currentQuestion = questions[currentIndex];
                      singleChoice =
                          (currentQuestion.type?.toLowerCase() ?? "") ==
                              "single_choice";

                      return QuestionsWidget(
                        questionEntity: currentQuestion,
                        currentIndex: currentIndex,
                        totalQuestions: questions.length,
                        selectedAnswers: selectedAnswers,
                        singleChoice: singleChoice,
                        onAnswerSelected: selectAnswer,
                      );
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            if (currentIndex > 0) {
                              setState(() {
                                currentIndex--;
                                //todo: get map of answer from db
                              });
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            side: const BorderSide(
                                color: AppColors.blue, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: const Text(Constants.backButtonText,
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final totalQuestions =
                                homeViewModel.state.questionsList?.length ?? 0;
                            if (currentIndex < totalQuestions - 1) {
                              setState(() {
                                currentIndex++;
                                //todo: update map of answer and save in db
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: const Text(
                            Constants.nextButtonText,
                            style:
                                TextStyle(fontSize: 16, color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

PreferredSizeWidget getAppBar({
  required BuildContext context,
}) {
  bool hasBuilt = false;
  return AppBar(
    title: Row(
      children: [
        Text(Constants.examTitle),
        const Spacer(),
        Image.asset(
          AppAssets.clockTimer,
          height: 30.h,
          width: 24.w,
        ),
        SizedBox(width: 10.w),
        //todo : add timer

        BlocBuilder<HomeViewModel, HomeState>(
          buildWhen: (previous, current) {
            if (!hasBuilt && current.questionsList != null) {
              hasBuilt = true;
              return true;
            }
            return false;
          },
          builder: (context, state) {
            final durationMinutes =
                state.questionsList?.firstOrNull?.exam?.duration?.toInt() ?? 0;
            final endTime = DateTime.now().millisecondsSinceEpoch +
                (1000 * 60 * durationMinutes);

            return CountdownTimer(
              endTime: endTime,
              widgetBuilder: (_, time) {
                if (time == null) return Text(Constants.timeUp);
                final minutes = time.min ?? 0;
                final seconds = time.sec ?? 0;
                return Text('$minutes:${seconds.toString().padLeft(2, '0')}',
                    style: AppStyles.medium18Green);
              },
            );
          },
        ),
      ],
    ),
  );
}
