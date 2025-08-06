import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/errors/localized_error_handler.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/features/home_screen/reusable_widgets/empty_state_widget.dart';
import 'package:online_exam_app/features/home_screen/reusable_widgets/loading_state_widget.dart';

import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../../core/models/subject_info.dart';
import '../../../../reusable_widgets/error_state_widget.dart';
import '../cubit/home_state.dart';
import '../cubit/home_view_model.dart';
import 'build_custom_text_field.dart';
import 'build_subject_item.dart';

class BuildHomeTabBody extends StatelessWidget {
  const BuildHomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.read<HomeViewModel>();
    final local = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildCustomTextField(
                  onChanged: (query) => viewModel.filterSubjects(query),
                ),
                SizedBox(height: 24.h),
                Text(
                  local.browse_by_subject,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<HomeViewModel, HomeState>(
            builder: (context, state) {
              switch (state.status) {
                case HomeStatus.loading:
                  return const LoadingStateWidget();

                case HomeStatus.error:
                  return ErrorStateWidget(
                    message: LocalizedErrorHandler.getErrorMessage(
                        context, state.errorMsg),
                    onRetry: () => viewModel.getAllSubjects(),
                  );

                case HomeStatus.success:
                  final subjectList = state.filteredSubjects;
                  if (subjectList.isEmpty) {
                    return EmptyStateWidget(
                      message: local.no_subjects_available,
                      icon: Icons.school_outlined,
                    );
                  }

                  return ClipRect(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: subjectList.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        final subject = subjectList[index];

                        return BuildSubjectItem(
                          subjectName: subject.name,
                          onSubjectTap: () {
                            final subjectInfo = SubjectInfo(
                              id: subject.id,
                              name: subject.name,
                            );

                            Navigator.pushNamed(
                              context,
                              AppRoutes.examsBySubjectScreen,
                              arguments: subjectInfo,
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
          ),
        ),
      ],
    );
  }
}
