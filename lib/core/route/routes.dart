import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/l10n/translation/app_localizations.dart';
import 'package:online_exam_app/core/provider/app_config_provider.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/pages/forget_password.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/pages/login_screen.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/pages/reset_password.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/pages/verification_code.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");
    switch (url.path) {
      case AppRoutes.home:
      // return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());

      case AppRoutes.resetPassword:
        return MaterialPageRoute(builder: (_) => ResetPassword());

      case AppRoutes.verificationCode:
        return MaterialPageRoute(builder: (_) => VerificationCode());

      default:
        return MaterialPageRoute(builder: (context) => Text("No Route Found"));
    }
  }
}
