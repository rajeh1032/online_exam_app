import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/assets/app_assets.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';

class ResultCard extends StatelessWidget {
  final ExamResult result;
  final VoidCallback onTap;
  ResultCard({super.key, required this.result, required this.onTap});
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: Image.asset(AppAssets.examImage, height: 71.h, width: 60.w),
        // title:

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              result.examTitle,
              style: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
            SizedBox(height: 8.h),
            Text(
              'Score: ${result.score}/${result.totalQuestions} (${result.percentage.toStringAsFixed(1)}%)',
              style: AppTheme.lightTheme.textTheme.headlineMedium,
            ),
            SizedBox(height: 4.h),
            Text(
              'Completed: ${_formatDate(result.completedAt)}',
              style: AppTheme.lightTheme.textTheme.headlineSmall,
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.w,
          color: Colors.grey[600],
        ),
        onTap: onTap,
      ),
    );
  }
}
