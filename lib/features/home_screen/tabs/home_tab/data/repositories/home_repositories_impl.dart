import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/data/datasources/home_remote_data_source.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/get_exam_questions_request_Entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/repositories/home_repositories.dart';

@Injectable(as: HomeRepositories)
class HomeRepositoriesImpl implements HomeRepositories {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepositoriesImpl({required HomeRemoteDataSource homeRemoteDataSource})
      : _homeRemoteDataSource = homeRemoteDataSource;
  @override
  Future<ApiResult<GetExamQuestionsResponseEntity>> getExamQuestions(
      GetExamQuestionsRequestEntity getExamQuestionsRequestEntity) {
    return _homeRemoteDataSource
        .getExamQuestions(getExamQuestionsRequestEntity);
  }
}
