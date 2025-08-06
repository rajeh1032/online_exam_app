import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/route/app_routes.dart';

import '../../../../../../core/errors/localized_error_handler.dart';
import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../reusable_widgets/error_state_widget.dart';
import '../../../../reusable_widgets/loading_state_widget.dart';
import '../cubit/exams_by_subject_cubit/exams_by_subject_state.dart';
import '../cubit/exams_by_subject_cubit/exams_by_subject_view_model.dart';
import 'exam_by_subject_item.dart';

class BuildExamsBySubjectBody extends StatelessWidget {
  final String subjectId;

  const BuildExamsBySubjectBody({
    super.key,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return BlocBuilder<ExamsBySubjectViewModel, ExamsBySubjectState>(
      builder: (context, state) {
        switch (state.status) {
          case ExamsBySubjectStatus.loading:
            return const LoadingStateWidget();

          case ExamsBySubjectStatus.error:
            return ErrorStateWidget(
              message: LocalizedErrorHandler.getErrorMessage(
                  context, state.errorMsg),
              onRetry: () => context
                  .read<ExamsBySubjectViewModel>()
                  .getExamsBySubject(subjectId),
            );

          case ExamsBySubjectStatus.success:
            if (state.exams.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: 64.sp,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      local.no_exams_available,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.all(16.0.w),
              child: ListView.builder(
                itemCount: state.exams.length,
                itemBuilder: (context, index) {
                  final exam = state.exams[index];
                  return ExamBySubjectItem(
                    duration: exam.duration ?? 0,
                    numberOfQuestions: exam.numberOfQuestions ?? 0,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.startExamScreen,
                        arguments: exam,
                      );
                    },
                  );
                },
              ),
            );

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
