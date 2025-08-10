import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/core/utils/exam_result_storage.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_app_bar.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/cubit/exam_result_cubit.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/cubit/exam_result_state.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/widgets/exam_answer_widgets/quiz_result_widget.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/widgets/exma_result_widgets/no_results_widget.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/widgets/exma_result_widgets/result_card.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExamResultCubit>()..getAllExamResults(),
      child: QuizResultScreenContent(),
    );
  }
}

class QuizResultScreenContent extends StatelessWidget {
  const QuizResultScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(title: "Results"),
      body: BlocBuilder<ExamResultCubit, ExamResultState>(
          builder: (context, state) {
        switch (state) {
          case ExamResultLoading():
            return const Center(child: CircularProgressIndicator());

          case ExamResultError():
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${state.errorMessage}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ExamResultCubit>().getAllExamResults();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );

          case AllExamResultsLoaded():
            if (state.examResults.isEmpty) {
              return const NoResultsWidget();
            }

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    'Your Exam Results',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                    child: RefreshIndicator(
                  onRefresh: () async {
                    await context.read<ExamResultCubit>().getAllExamResults();
                  },
                  child: ListView.builder(
                      itemCount: state.examResults.length,
                      itemBuilder: (context, index) {
                        return ResultCard(
                            result: state.examResults[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuizResultWidget(
                                      examResult: state.examResults[index]),
                                ),
                              );
                            });
                      }),
                ))
              ],
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
