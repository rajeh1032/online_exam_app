import 'package:flutter/material.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/utils/shared_pref_services.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  final sharedPrefService = getIt<SharedPrefService>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(),
        Text("user Token is :${sharedPrefService.getToken()}" ??
            'no token saved'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.examQuestions);
            },
            child: Text("go to exam Questions")),
      ],
    );
  }
}
