// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/api/client/auth_api_client.dart' as _i213;
import '../../features/auth/api/data_source_impl/auth_remote_data_source_impl.dart'
    as _i758;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/local/auth_local_data_source.dart' as _i284;
import '../../features/auth/data/local/local_impl/auth_local_data_source_impl.dart'
    as _i560;
import '../../features/auth/data/repositories/auth_repositories_impl.dart'
    as _i394;
import '../../features/auth/domain/repositories/auth_repositories.dart'
    as _i962;
import '../../features/auth/domain/usecases/forget_password_use_case.dart'
    as _i591;
import '../../features/auth/domain/usecases/reset_password_use_case.dart'
    as _i825;
import '../../features/auth/domain/usecases/sign_in_use_case.dart' as _i362;
import '../../features/auth/domain/usecases/sign_up_use_case.dart' as _i1037;
import '../../features/auth/domain/usecases/verify_reset_code_use_case.dart'
    as _i948;
import '../../features/auth/presentation/auth/cubit/view_models/forget_password_view_model.dart'
    as _i894;
import '../../features/auth/presentation/auth/cubit/view_models/reset_password_view_model.dart'
    as _i479;
import '../../features/auth/presentation/auth/cubit/view_models/sign_in_view_model.dart'
    as _i947;
import '../../features/auth/presentation/auth/cubit/view_models/signup_view_model.dart'
    as _i546;
import '../../features/auth/presentation/auth/cubit/view_models/verification_code_view_model.dart'
    as _i1064;
import '../../features/home_screen/cubit/home_screen_view_model.dart' as _i147;
import '../../features/home_screen/tabs/home_tab/api/client/home_api_client.dart'
    as _i952;
import '../../features/home_screen/tabs/home_tab/api/data_source_impl/home_remote_data_source_impl.dart'
    as _i334;
import '../../features/home_screen/tabs/home_tab/data/datasources/home_remote_data_source.dart'
    as _i523;
import '../../features/home_screen/tabs/home_tab/data/repositories/home_repositories_impl.dart'
    as _i938;
import '../../features/home_screen/tabs/home_tab/domain/repositories/home_repositories.dart'
    as _i1022;
import '../../features/home_screen/tabs/home_tab/domain/usecases/get_all_exam_on_subject_use_case.dart'
    as _i1008;
import '../../features/home_screen/tabs/home_tab/domain/usecases/get_all_subject_use_case.dart'
    as _i48;
import '../../features/home_screen/tabs/home_tab/domain/usecases/get_exam_questions_use_case.dart'
    as _i272;
import '../../features/home_screen/tabs/home_tab/presentation/cubit/exam_questions/exam_questions_view_model.dart'
    as _i310;
import '../../features/home_screen/tabs/home_tab/presentation/cubit/exams_by_subject_cubit/exams_by_subject_view_model.dart'
    as _i833;
import '../../features/home_screen/tabs/home_tab/presentation/cubit/home_view_model.dart'
    as _i391;
import '../provider/app_config_provider.dart' as _i291;
import '../provider/user_provider.dart' as _i505;
import '../utils/shared_pref_services.dart' as _i0;
import 'modules/dio_modules.dart' as _i288;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModules = _$DioModules();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i147.HomeScreenViewModel>(() => _i147.HomeScreenViewModel());
    gh.singleton<_i505.UserProvider>(() => _i505.UserProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModules.providePrettyDioLogger());
    gh.lazySingleton<_i361.Dio>(
        () => dioModules.provideDio(gh<_i528.PrettyDioLogger>()));
    gh.factory<_i0.SharedPrefService>(
        () => _i0.SharedPrefService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i284.AuthLocalDataSource>(
        () => _i560.AuthLocalDataSourceImpl(gh<_i0.SharedPrefService>()));
    gh.factory<_i213.AuthApiClient>(() => _i213.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i952.HomeApiClient>(() => _i952.HomeApiClient(gh<_i361.Dio>()));
    gh.factory<_i523.HomeRemoteDataSource>(() => _i334.HomeRemoteDataSourceImpl(
        homeApiClient: gh<_i952.HomeApiClient>()));
    gh.singleton<_i291.AppConfigProvider>(
        () => _i291.AppConfigProvider(gh<_i460.SharedPreferences>()));
    gh.factory<_i107.AuthRemoteDataSource>(() => _i758.AuthRemoteDataSourceImpl(
          authApiClient: gh<_i213.AuthApiClient>(),
          authLocalDataSource: gh<_i284.AuthLocalDataSource>(),
        ));
    gh.factory<_i1022.HomeRepositories>(() => _i938.HomeRepositoriesImpl(
        homeRemoteDataSource: gh<_i523.HomeRemoteDataSource>()));
    gh.factory<_i272.GetExamQuestionsUseCase>(
        () => _i272.GetExamQuestionsUseCase(gh<_i1022.HomeRepositories>()));
    gh.factory<_i310.ExamQuestionsViewModel>(() =>
        _i310.ExamQuestionsViewModel(gh<_i272.GetExamQuestionsUseCase>()));
    gh.factory<_i962.AuthRepository>(() => _i394.AuthRepositoriesImpl(
        authRemoteDataSource: gh<_i107.AuthRemoteDataSource>()));
    gh.factory<_i1008.GetAllExamOnSubjectUseCase>(
        () => _i1008.GetAllExamOnSubjectUseCase(gh<_i1022.HomeRepositories>()));
    gh.factory<_i48.GetAllSubjectUseCase>(
        () => _i48.GetAllSubjectUseCase(gh<_i1022.HomeRepositories>()));
    gh.factory<_i591.ForgetPasswordUseCase>(
        () => _i591.ForgetPasswordUseCase(gh<_i962.AuthRepository>()));
    gh.factory<_i825.ResetPasswordUseCase>(
        () => _i825.ResetPasswordUseCase(gh<_i962.AuthRepository>()));
    gh.factory<_i362.SignInUseCase>(
        () => _i362.SignInUseCase(gh<_i962.AuthRepository>()));
    gh.factory<_i1037.SignUpUseCase>(
        () => _i1037.SignUpUseCase(gh<_i962.AuthRepository>()));
    gh.factory<_i948.VerifyResetCodeUseCase>(
        () => _i948.VerifyResetCodeUseCase(gh<_i962.AuthRepository>()));
    gh.factory<_i391.HomeViewModel>(() => _i391.HomeViewModel(
        getAllSubjectUseCase: gh<_i48.GetAllSubjectUseCase>()));
    gh.factory<_i1064.VerificationCodeViewModel>(
        () => _i1064.VerificationCodeViewModel(
              verifyResetCodeUseCase: gh<_i948.VerifyResetCodeUseCase>(),
              appConfigProvider: gh<_i291.AppConfigProvider>(),
            ));
    gh.factory<_i947.SignInViewModel>(() => _i947.SignInViewModel(
          signInUseCase: gh<_i362.SignInUseCase>(),
          appConfigProvider: gh<_i291.AppConfigProvider>(),
        ));
    gh.factory<_i833.ExamsBySubjectViewModel>(() =>
        _i833.ExamsBySubjectViewModel(
            getAllExamOnSubjectUseCase:
                gh<_i1008.GetAllExamOnSubjectUseCase>()));
    gh.factory<_i479.ResetPasswordViewModel>(() => _i479.ResetPasswordViewModel(
          resetPasswordUseCase: gh<_i825.ResetPasswordUseCase>(),
          appConfigProvider: gh<_i291.AppConfigProvider>(),
        ));
    gh.factory<_i894.ForgetPasswordViewModel>(
        () => _i894.ForgetPasswordViewModel(
              forgetPasswordUseCase: gh<_i591.ForgetPasswordUseCase>(),
              appConfigProvider: gh<_i291.AppConfigProvider>(),
            ));
    gh.factory<_i546.SignUpViewModel>(
        () => _i546.SignUpViewModel(signUpUseCase: gh<_i1037.SignUpUseCase>()));
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModules extends _i288.DioModules {}
