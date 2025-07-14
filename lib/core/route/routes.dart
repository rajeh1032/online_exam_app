import 'package:flutter/material.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/l10n/translation/app_localizations.dart';
import 'package:online_exam_app/core/provider/app_config_provider.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/pages/login_screen.dart';

import '../../presentation/features/auth/presentation/auth/pages/signup_screen.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");
    switch (url.path) {
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(),
                      Text("No Route"),
                      FilledButton(
                        onPressed: () {
                          if (getIt<AppConfigProvider>().isEn()) {
                            getIt<AppConfigProvider>()
                                .changeLocal(Constants.arLocalKey);
                          } else {
                            getIt<AppConfigProvider>()
                                .changeLocal(Constants.enLocalKey);
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.test),
                      ),
                      FilledButton(
                        onPressed: () {
                          if (getIt<AppConfigProvider>().currentTheme ==
                              ThemeMode.dark) {
                            getIt<AppConfigProvider>()
                                .changeTheme(ThemeMode.light);
                          } else {
                            getIt<AppConfigProvider>()
                                .changeTheme(ThemeMode.dark);
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.test),
                      )
                    ],
                  ),
                ));
    }
  }
}
