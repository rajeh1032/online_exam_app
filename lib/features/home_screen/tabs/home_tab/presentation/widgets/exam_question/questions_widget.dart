import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';

class QuestionsWidget extends StatelessWidget {
  final List<int> selectedAnswers;
  final QuestionsEntity questionEntity;
  final bool singleChoice;
  final int currentIndex;
  final int totalQuestions;
  final void Function(int index) onAnswerSelected;

  QuestionsWidget({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.questionEntity,
    required this.selectedAnswers,
    required this.singleChoice,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final options = questionEntity.answers;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //todo:add question number
            Text('Question ${currentIndex + 1} of $totalQuestions',
                style: AppTheme.lightTheme.textTheme.headlineLarge!
                    .copyWith(color: AppColors.gray)),
          ],
        ),
        SizedBox(height: 8.h),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(16.r),
          value: (currentIndex + 1) / totalQuestions,
          backgroundColor: Colors.grey.shade300,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.blue),
        ),

        SizedBox(height: 24.h),

        //todo : add question
        Text(questionEntity.question!,
            style: AppTheme.lightTheme.textTheme.headlineLarge!),
        SizedBox(height: 24.h),
        ...List.generate(options?.length ?? 0, (index) {
          final isSelected = selectedAnswers.contains(index);
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            height: 70.h,
            child: GestureDetector(
              onTap: () => onAnswerSelected(index),
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isSelected ? const Color(0xFFABBCDE) : AppColors.gray,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: isSelected ? AppColors.blue[20] : AppColors.white,
                ),
                child: Row(
                  children: [
                    singleChoice
                        ? Radio<int>(
                            value: index,
                            groupValue: selectedAnswers.isNotEmpty
                                ? selectedAnswers.first
                                : -1,
                            onChanged: (value) {
                              onAnswerSelected(index);
                            },
                            activeColor: AppColors.blue,
                          )
                        : Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.blue
                                    : AppColors.gray,
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.circular(3.r),
                              color:
                                  isSelected ? AppColors.blue : AppColors.white,
                            ),
                            child: isSelected
                                ? const Icon(Icons.check,
                                    color: AppColors.white, size: 14)
                                : null,
                          ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(options?[index].answer ?? '',
                          style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
