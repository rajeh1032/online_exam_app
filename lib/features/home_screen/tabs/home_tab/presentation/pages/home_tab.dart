import 'package:flutter/material.dart';
import 'package:online_exam_app/core/di/di.dart';
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
        Row(),
        Text("user Token is :${sharedPrefService.getToken()}" ??
            'no token saved')
      ],
    );
  }
}
