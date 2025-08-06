import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/exam_entity.dart';

import '../../../../../../core/assets/app_assets.dart';
import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../widgets/build_exam_details.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final ExamEntity? exam =
        ModalRoute.of(context)?.settings.arguments as ExamEntity?;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding:  EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildExamDetails(
                examIcon: AppAssets.examIcon,
                examTitle: exam?.title,
                examDuration: exam?.duration,
                examNumberOfQuestions: exam?.numberOfQuestions,),
               SizedBox(height: 16.h),
              Divider(
                color: AppColors.blue[10],
              ),
               SizedBox(height: 64.h),
              SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context,AppRoutes.examQuestions,
                            arguments: exam);
                      }, child: Text(localizations.start))),
            ],
          )),
    );
  }
}
