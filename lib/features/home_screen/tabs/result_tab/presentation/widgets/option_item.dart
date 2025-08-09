import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class OptionItem extends StatelessWidget {
  final AnswerOption answerOption;
  final String correctAnswerKey;
  final String userAnswerKey;

  OptionItem(
      {super.key,
      required this.answerOption,
      required this.correctAnswerKey,
      required this.userAnswerKey});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    Widget? leadingIcon;

    if (answerOption.key == correctAnswerKey) {
      backgroundColor = AppColors.green.withOpacity(0.1);
      borderColor = AppColors.green;
      leadingIcon = Icon(Icons.check, size: 16.sp, color: AppColors.green);
    } else if (answerOption.key == userAnswerKey) {
      backgroundColor = AppColors.red.withOpacity(0.1);
      borderColor = AppColors.red;
      leadingIcon = Icon(Icons.close, size: 16.sp, color: Colors.red);
    } else {
      backgroundColor = AppColors.gray.withOpacity(.05);
      borderColor = Colors.grey.withOpacity(0.3);
      leadingIcon =
          const Icon(Icons.circle_outlined, size: 16, color: Colors.grey);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Center(child: leadingIcon),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              '${answerOption.key}. ${answerOption.answerText}',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
