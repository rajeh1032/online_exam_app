import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:online_exam_app/core/assets/app_assets.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

import '../../../../../../core/l10n/translation/app_localizations.dart';

class ExamBySubjectItem extends StatelessWidget {
  final int duration;
  final int numberOfQuestions;
  final VoidCallback? onTap;

  const ExamBySubjectItem({
    super.key,
    required this.duration,
    required this.numberOfQuestions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return InkWell(
      onTap: onTap,
      child: Container(
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

            Container(
              width: 48.w,
              height: 48.h,
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
                        localizations.high_level,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '$duration ${localizations.exam_minutes_suffix}',
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
                    '$numberOfQuestions ${localizations.exam_question_suffix}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${localizations.exam_from_label} ',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${localizations.exam_start_time} ',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '${localizations.exam_to_label} ',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        localizations.exam_end_time,
                        style: const TextStyle(
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
      ),
    );
  }
}
