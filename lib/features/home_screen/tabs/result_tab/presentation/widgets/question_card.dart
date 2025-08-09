import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/widgets/option_item.dart';

class QuestionCard extends StatelessWidget {
  final int questionNumber;
  final QuestionResult questionResult;
  QuestionCard(
      {super.key, required this.questionNumber, required this.questionResult});

  @override
  Widget build(BuildContext context) {
    final isCorrect = questionResult.isCorrect;
    final userAnswerOption = questionResult.userAnswerOption;

    final correctAnswerOption = questionResult.correctAnswerOption;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 4.r,
              offset: const Offset(0, 2),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'Question $questionNumber',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            questionResult.questionText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          ...questionResult.answerOptions.map((answerOption) {
            return OptionItem(
              answerOption: answerOption,
              correctAnswerKey: questionResult.correctAnswerKey,
              userAnswerKey: questionResult.userAnswerKey,
            );
          }).toList(),
        ],
      ),
    );
  }
}
