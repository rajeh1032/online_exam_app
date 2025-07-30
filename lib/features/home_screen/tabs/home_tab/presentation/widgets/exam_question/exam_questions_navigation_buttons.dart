import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class ExamQuestionsNavigationButtons extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSubmit;

  const ExamQuestionsNavigationButtons(
      {super.key,
      required this.currentIndex,
      required this.totalQuestions,
      required this.onPrevious,
      required this.onNext,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final isLastQuestion = currentIndex == totalQuestions - 1;
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: currentIndex > 0 ? onPrevious : null,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              side: const BorderSide(color: AppColors.blue, width: 2),
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
            onPressed: isLastQuestion ? onSubmit : onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: const Text(
              Constants.nextButtonText,
              style: TextStyle(fontSize: 16, color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
