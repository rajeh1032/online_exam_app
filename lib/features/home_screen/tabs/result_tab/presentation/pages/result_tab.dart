import 'package:flutter/material.dart';
import 'package:online_exam_app/core/route/app_routes.dart';

class ResultTab extends StatelessWidget {
  const ResultTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.examQuestionsAnswer);
              },
              child: Text("go to exam Questions")),
        ],
      ),
    );
  }
}
