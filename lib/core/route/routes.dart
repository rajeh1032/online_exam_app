import 'package:flutter/material.dart';

import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/features/auth/presentation/auth/pages/forget_password.dart';

import 'package:online_exam_app/features/auth/presentation/auth/pages/reset_password.dart';
import 'package:online_exam_app/features/auth/presentation/auth/pages/verification_code.dart';
import 'package:online_exam_app/features/home_screen/pages/home_screen.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/pages/exam_questions_screen.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/pages/start_exam_screen.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/presentation/pages/change_password_screen.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/pages/quiz_result_screen.dart';

import '../../features/auth/presentation/auth/pages/sign_in_screen.dart';
import '../../features/auth/presentation/auth/pages/sign_up_screen.dart';
import '../../features/home_screen/tabs/home_tab/presentation/pages/exams_by_subject_screen.dart';

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
        return MaterialPageRoute(builder: (_) => ExamQuestionsScreen());
      case AppRoutes.examQuestionsAnswer:
        return MaterialPageRoute(builder: (_) => QuizResultScreen());
      case AppRoutes.examsBySubjectScreen:
        return MaterialPageRoute(
          builder: (_) => ExamsBySubjectScreen(),
          settings: settings,
        );
      case AppRoutes.startExamScreen:
        return MaterialPageRoute(
            builder: (_) => const StartExamScreen(), settings: settings);
      case AppRoutes.changePassword:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Text("No Route Found"));
    }
  }
}
