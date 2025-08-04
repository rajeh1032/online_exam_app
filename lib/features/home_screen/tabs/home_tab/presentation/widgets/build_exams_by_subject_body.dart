import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constant/constants.dart';

import '../../../../reusable_widgets/error_state_widget.dart';
import '../../../../reusable_widgets/loading_state_widget.dart';
import '../cubit/exams_by_subject_cubit/exams_by_subject_state.dart';
import '../cubit/exams_by_subject_cubit/exams_by_subject_view_model.dart';
import 'exam_by_subject_item.dart';

class BuildExamsBySubjectBody extends StatefulWidget {
  final String subjectId;
  final ExamsBySubjectViewModel viewModel;

  const BuildExamsBySubjectBody(
      {super.key, required this.subjectId, required this.viewModel});

  @override
  State<BuildExamsBySubjectBody> createState() =>
      _BuildExamsBySubjectBodyState();
}

class _BuildExamsBySubjectBodyState extends State<BuildExamsBySubjectBody> {
  @override
  void initState() {
    super.initState();

    widget.viewModel.getExamsBySubject(widget.subjectId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamsBySubjectViewModel, ExamsBySubjectState>(
      builder: (context, state) {
        switch (state.status) {
          case ExamsBySubjectStatus.loading:
            return const LoadingStateWidget();

          case ExamsBySubjectStatus.error:
            return ErrorStateWidget(
              message: state.errorMsg ?? Constants.unexpectedError,
              onRetry: () {
                widget.viewModel.getExamsBySubject(widget.subjectId);
              },
            );

          case ExamsBySubjectStatus.success:
            if (state.exams.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      Constants.noExamsAvailable,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.exams.length,
                itemBuilder: (context, index) {
                  final exam = state.exams[index];
                  return ExamBySubjectItem(
                    duration: exam.duration ?? 0,
                    numberOfQuestions: exam.numberOfQuestions ?? 0,
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
