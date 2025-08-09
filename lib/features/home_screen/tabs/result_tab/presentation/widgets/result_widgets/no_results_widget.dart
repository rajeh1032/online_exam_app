// 📁 features/home_screen/tabs/result_tab/presentation/widgets/no_results_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.quiz_outlined,
            size: 64.w,
            color: AppColors.gray,
          ),
          SizedBox(height: 16.h),
          Text(
            'No exam results found',
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.gray,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Take an exam to see your results here',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
