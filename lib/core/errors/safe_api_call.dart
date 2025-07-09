import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:online_exam_app/core/errors/failures.dart';

Future<Either<Failures, T>> safeApiCall<T>(
  Future<T> Function() call,
) async {
  try {
    final result = await call();
    return Right(result);
  } on DioException catch (dioError) {
    final message = dioError.response?.data['message'] ?? dioError.message;
    return Left(ServerError(errorMessage: message));
  } catch (e) {
    return Left(ServerError(errorMessage: e.toString()));
  }
}
