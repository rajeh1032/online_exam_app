import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/assets/app_assets.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_state.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_view_model.dart';

class ExamQuestionsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onSubmitExam;

  ExamQuestionsAppBar({
    super.key,
    required this.onSubmitExam,
  });

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.read<HomeViewModel>();
    return AppBar(
      title: Row(
        children: [
          const Text(Constants.examTitle),
          const Spacer(),
          Image.asset(
            AppAssets.clockTimer,
            height: 30.h,
            width: 24.w,
          ),
          SizedBox(width: 10.w),
          _buildTimer()
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return BlocBuilder<HomeViewModel, HomeState>(
        buildWhen: (previous, current) =>
            previous.questionsList != null && current.questionsList != null,
        builder: (context, state) {
          final durationMinutes =
              state.questionsList?.firstOrNull?.exam?.duration?.toInt() ?? 0;

          if (durationMinutes <= 0) {
            return Text(Constants.timeUp);
          }
          final endTime = DateTime.now().millisecondsSinceEpoch +
              (1000 * 60 * durationMinutes);

          return CountdownTimer(
            endTime: endTime,
            onEnd: onSubmitExam,
            widgetBuilder: (_, time) {
              if (time == null) {
                return Text(Constants.timeUp);
              }
              final minutes = time.min ?? 0;
              final seconds = time.sec ?? 0;
              return Text(
                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              );
            },
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
