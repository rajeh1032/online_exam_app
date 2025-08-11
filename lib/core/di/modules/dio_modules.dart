import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_manger/api_endpoint.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/auth/data/local/auth_local_data_source.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModules {
  @lazySingleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }

  @lazySingleton
  Dio provideDio(PrettyDioLogger logger) {
    final dio = Dio();
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    dio.options.baseUrl = ApiEndpoint.baseUrl;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = await getIt<AuthLocalDataSource>().getToken();

      if (token != null && token.isNotEmpty) {
        options.headers['token'] = '$token';
      }

      return handler.next(options);
    }));
    dio.interceptors.add(logger);
    return dio;
  }
}
