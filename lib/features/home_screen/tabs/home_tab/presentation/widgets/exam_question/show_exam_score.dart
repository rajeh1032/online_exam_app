import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_app_bar.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_elevated_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ShowExamScore extends StatelessWidget {
  int score;
  int totalQuestions;
  ShowExamScore({super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    final double percentage = score / totalQuestions * 100;
    return Scaffold(
      appBar: BuildAppBar(title: Constants.examTitle),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Constants.examScore,
                style: AppTheme.lightTheme.textTheme.titleLarge!.copyWith(
                  fontSize: 30.sp,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  CircularPercentIndicator(
                    radius: 80.0,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 8.0,
                    percent: percentage / 100,
                    center: Text(
                      "${percentage.toStringAsFixed(0)}%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: AppColors.red,
                    progressColor: AppColors.blue,
                  ),
                  SizedBox(width: 23.w),
                  Column(
                    spacing: 10.h,
                    children: [
                      Text(
                        Constants.correct,
                        style: AppTheme.lightTheme.textTheme.titleLarge!
                            .copyWith(color: AppColors.blue),
                      ),
                      Text(
                        Constants.incorrect,
                        style: AppTheme.lightTheme.textTheme.titleLarge!
                            .copyWith(color: AppColors.red),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    spacing: 10.h,
                    children: [
                      build_degree_circle(
                          totalQuestions: totalQuestions,
                          score: score,
                          borderColor: AppColors.blue,
                          textColor: AppColors.blue),
                      build_degree_circle(
                          totalQuestions: totalQuestions,
                          score: score,
                          borderColor: AppColors.red,
                          textColor: AppColors.red),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 80.h),
              BuildElevatedButton(
                onPressed: () {},
                text: 'show result',
                borderRadius: BorderRadius.circular(40.r),
              ),
              SizedBox(height: 16.h),
              BuildElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                text: 'start again',
                backgroundColor: AppColors.white,
                textColor: AppColors.blue,
                borderRadius: BorderRadius.circular(40.r),
              )
            ],
          )),
    );
  }
}

class build_degree_circle extends StatelessWidget {
  build_degree_circle({
    super.key,
    required this.totalQuestions,
    required this.score,
    required this.borderColor,
    required this.textColor,
  });

  final int totalQuestions;
  final int score;
  Color borderColor;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Center(
        child: Text(
          "${totalQuestions - score}",
          style: AppTheme.lightTheme.textTheme.headlineLarge!
              .copyWith(color: textColor),
        ),
      ),
    );
  }
}
