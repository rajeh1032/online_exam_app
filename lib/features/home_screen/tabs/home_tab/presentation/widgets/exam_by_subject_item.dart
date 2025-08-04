import 'package:flutter/material.dart';

import 'package:online_exam_app/core/assets/app_assets.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class ExamBySubjectItem extends StatelessWidget {
  final int duration;

  final int numberOfQuestions;

  const ExamBySubjectItem(
      {super.key, required this.duration, required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkWhite, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              AppAssets.examIcon,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 12),

          // Right info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Constants.highLevel,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '$duration ${Constants.examMinutesSuffix}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '$numberOfQuestions ${Constants.examQuestionSuffix}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Text(
                      '${Constants.examFromLabel} ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      '${Constants.examStartTime} ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      Constants.examToLabel,
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      Constants.examEndTime,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
