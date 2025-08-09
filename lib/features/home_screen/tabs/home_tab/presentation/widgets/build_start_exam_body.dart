import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/app_assets.dart';
import '../../../../../../core/constant/constants.dart';

class BuildStartExamBody extends StatelessWidget {
  final String title ;
  final int duration;
  final int numberOfQuestions;
  final VoidCallback? onPressed;
  const BuildStartExamBody({super.key,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          Row(
            children: [
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
              SizedBox(width: 8.w),
              Text(title,
                  style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              Text(
                '$duration ${Constants.examMinutesSuffix}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(Constants.highLevel,
                  style: Theme.of(context).textTheme.titleMedium),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  '|',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              Text(
                  ' $numberOfQuestions ${Constants.examQuestionSuffix}',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          SizedBox(height: 64.h),
          SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                  onPressed:onPressed,
                  child: Text(
                    Constants.start,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )))
        ],
      ),
    );
  }
}
