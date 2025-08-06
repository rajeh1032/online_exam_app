import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/l10n/translation/app_localizations.dart';

class BuildExamDetails extends StatelessWidget {
 final String examIcon;
 final String? examTitle;
 final int? examDuration;
 final int? examNumberOfQuestions;

  const BuildExamDetails({super.key,
    required this.examIcon,
    this.examTitle,
    this.examDuration,
    this.examNumberOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              examIcon,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12.w),
            Text(
              examTitle??'',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Text(
              '${examDuration ?? 0} ${localizations.exam_minutes_suffix}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Text(
              localizations.high_level,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 1,
              height: 16,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
                '${examNumberOfQuestions?? 0} ${localizations.exam_question_suffix}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
