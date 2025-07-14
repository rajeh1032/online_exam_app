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

import '../../presentation/features/auth/api/client/auth_api_client.dart'
    as _i351;
import '../../presentation/features/auth/api/data_source_impl/auth_remote_data_source_impl.dart'
    as _i776;
import '../../presentation/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i866;
import '../../presentation/features/auth/data/repositories/auth_repositories_impl.dart'
    as _i344;
import '../../presentation/features/auth/domain/repositories/auth_repositories.dart'
    as _i323;
import '../../presentation/features/auth/domain/usecases/forget_password_use_case.dart'
    as _i625;
import '../../presentation/features/auth/domain/usecases/sign_in_use_case.dart'
    as _i306;
import '../../presentation/features/auth/domain/usecases/verify_reset_code_use_case.dart'
    as _i562;
import '../../presentation/features/auth/presentation/auth/cubit/view_models/auth_view_model.dart'
    as _i10;
import '../../presentation/features/auth/presentation/auth/cubit/view_models/forget_password_view_model.dart'
    as _i712;
import '../../presentation/features/auth/presentation/auth/cubit/view_models/verification_code_view_model.dart'
    as _i730;
import '../provider/app_config_provider.dart' as _i291;
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
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModules.providePrettyDioLogger());
    gh.lazySingleton<_i361.Dio>(
        () => dioModules.provideDio(gh<_i528.PrettyDioLogger>()));
    gh.factory<_i351.AuthApiClient>(() => _i351.AuthApiClient(gh<_i361.Dio>()));
    gh.factory<_i866.AuthRemoteDataSource>(
        () => _i776.AuthRemoteDataSourceImpl(gh<_i351.AuthApiClient>()));
    gh.singleton<_i291.AppConfigProvider>(
        () => _i291.AppConfigProvider(gh<_i460.SharedPreferences>()));
    gh.factory<_i323.AuthRepository>(
        () => _i344.AuthRepositoriesImpl(gh<_i866.AuthRemoteDataSource>()));
    gh.factory<_i306.SignInUseCase>(
        () => _i306.SignInUseCase(gh<_i323.AuthRepository>()));
    gh.factory<_i625.ForgetPasswordUseCase>(
        () => _i625.ForgetPasswordUseCase(gh<_i323.AuthRepository>()));
    gh.factory<_i562.VerifyResetCodeUseCase>(
        () => _i562.VerifyResetCodeUseCase(gh<_i323.AuthRepository>()));
    gh.factory<_i10.AuthViewModel>(
        () => _i10.AuthViewModel(signInUseCase: gh<_i306.SignInUseCase>()));
    gh.factory<_i730.VerificationCodeViewModel>(() =>
        _i730.VerificationCodeViewModel(
            verifyResetCodeUseCase: gh<_i562.VerifyResetCodeUseCase>()));
    gh.factory<_i712.ForgetPasswordViewModel>(() =>
        _i712.ForgetPasswordViewModel(
            forgetPasswordUseCase: gh<_i625.ForgetPasswordUseCase>()));
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModules extends _i288.DioModules {}
