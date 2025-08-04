import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/di/di.dart';

import '../../../../../../core/models/subject_info.dart';
import '../cubit/exams_by_subject_cubit/exams_by_subject_view_model.dart';
import '../widgets/build_exams_by_subject_body.dart';

class ExamsBySubjectScreen extends StatelessWidget {
  const ExamsBySubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final ExamsBySubjectViewModel viewModel = getIt<ExamsBySubjectViewModel>();
    if (arguments is! SubjectInfo) {
      return Scaffold(
        appBar: AppBar(title: const Text(Constants.unexpectedError)),
        body: const Center(
          child: Text(Constants.invalidNavigationData),
        ),
      );
    }

    final subjectInfo = arguments;

    return BlocProvider<ExamsBySubjectViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            subjectInfo.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                ),
          ),
        ),
        body: BuildExamsBySubjectBody(
          subjectId: subjectInfo.id,
          viewModel: viewModel,
        ),
      ),
    );
  }
}
