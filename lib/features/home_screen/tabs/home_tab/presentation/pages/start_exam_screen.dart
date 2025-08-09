import 'package:flutter/material.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/build_start_exam_body.dart';



class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as ExamEntity;

    return Scaffold(
      appBar: AppBar(),
      body: BuildStartExamBody(
          title: arguments.title ?? '',
          duration: arguments.duration ?? 0,
          numberOfQuestions: arguments.numberOfQuestions ?? 0,
         onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.examQuestions,

            );
          }
      ),
    );
  }
}
