import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_app_bar.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/widgets/exam_answer_widgets/question_card.dart';

class QuizResultWidget extends StatelessWidget {
  final ExamResult? examResult;
  QuizResultWidget({super.key, this.examResult});

  @override
  Widget build(BuildContext context) {
    final result = examResult;

    if (result == null)
      return Scaffold(
        appBar: BuildAppBar(title: "Exam Results"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64.w,
                color: Colors.grey[400],
              ),
              SizedBox(height: 16.h),
              Text(
                'No exam result found',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      );
    return Scaffold(
      appBar: BuildAppBar(
        title: "Answers",
      ),
      body: Padding(
          padding: EdgeInsetsGeometry.all(16.w),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: result.questions.length,
                      itemBuilder: (context, index) {
                        final questionNumber = index + 1;
                        final questionResult = result.questions[index];
                        return QuestionCard(
                          questionNumber: questionNumber,
                          questionResult: questionResult,
                        );
                      }))
            ],
          )),
    );
  }
}
