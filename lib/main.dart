import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/l10n/translation/app_localizations.dart';
import 'package:online_exam_app/core/provider/app_config_provider.dart';
import 'package:online_exam_app/core/provider/profile_photo_provider.dart';
import 'package:online_exam_app/core/provider/remember_me_provider.dart';
import 'package:online_exam_app/core/provider/user_provider.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/route/routes.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/core/utils/exam_result_storage.dart';
import 'package:online_exam_app/core/utils/my_bloc_observer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await ExamResultStorage.init();
  await configureDependencies();
  final appConfigProvider = getIt<AppConfigProvider>();
  final userProvider = getIt<UserProvider>();
  final profilePhotoProvider = getIt<ProfilePhotoProvider>();
  final rememberMeProvider= getIt<RememberMeProvider>();

  final rememberMe=rememberMeProvider.isRememberMeEnabled;
  final String initialRoute = rememberMe
      ? AppRoutes.homeScreen
      : AppRoutes.login;

  await appConfigProvider.loadConfig();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: appConfigProvider),
    ChangeNotifierProvider.value(value: userProvider),
    ChangeNotifierProvider.value(value: profilePhotoProvider),
    ChangeNotifierProvider.value(value: rememberMeProvider),
  ], child: MyApp(initialRoute: initialRoute)));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({super.key, required this. initialRoute});
  late AppConfigProvider appConfigProvider;

  @override
  Widget build(BuildContext context) {
    appConfigProvider = Provider.of(context);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            // darkTheme: AppTheme.darkTheme,
            themeMode: appConfigProvider.currentTheme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(appConfigProvider.selectedLocal),
            onGenerateRoute: Routes.generateRoute,
            initialRoute: initialRoute,
          );
        });
  }
}
