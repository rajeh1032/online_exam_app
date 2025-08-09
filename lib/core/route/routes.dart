import 'package:flutter/material.dart';

import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/features/auth/presentation/auth/pages/forget_password.dart';

import 'package:online_exam_app/features/auth/presentation/auth/pages/reset_password.dart';
import 'package:online_exam_app/features/auth/presentation/auth/pages/verification_code.dart';
import 'package:online_exam_app/features/home_screen/pages/home_screen.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/pages/exam_questions_screen.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/pages/quiz_result_screen.dart';

import '../../features/auth/presentation/auth/pages/sign_in_screen.dart';
import '../../features/auth/presentation/auth/pages/sign_up_screen.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");
    switch (url.path) {
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());

      case AppRoutes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPassword());

      case AppRoutes.verificationCode:
        return MaterialPageRoute(builder: (_) => const VerificationCode());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.examQuestions:
        return MaterialPageRoute(
            builder: (_) => ExamQuestionsScreen(
                  examId: '6700708d30a3c3c1944a9c60',
                ));
      case AppRoutes.examQuestionsAnswer:
        return MaterialPageRoute(builder: (_) => QuizResultScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Text("No Route Found"));
    }
  }
}
