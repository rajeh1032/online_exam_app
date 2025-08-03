import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/core/errors/error_handler.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/client/home_api_client.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/mapper/get_all_subject_dto_mapper.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/mapper/get_exam_questions_response_dto_mapper.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/data/datasources/home_remote_data_source.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/request/get_exam_questions_request_Entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_all_subject_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final HomeApiClient _homeApiClient;
  HomeRemoteDataSourceImpl({required HomeApiClient homeApiClient})
      : _homeApiClient = homeApiClient;

  @override
  Future<ApiResult<GetExamQuestionsResponseEntity>> getExamQuestions(
      GetExamQuestionsRequestEntity getExamQuestionsRequestEntity) async {
    try {
      var response = await _homeApiClient.getExamQuestions(
        getExamQuestionsRequestEntity.subjectId,
      );
      return ApiSuccessResult(data: response.toEntity());
    } catch (e) {
      return ApiErrorResult<GetExamQuestionsResponseEntity>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
    }
  }

  @override
  Future<ApiResult<GetAllSubjectsResponseEntity>> getAllSubjects()async {
   try{
     var response =await _homeApiClient.getAllSubjects();
      return ApiSuccessResult(data: response.toEntity());
   }
   catch(e){
      return ApiErrorResult<GetAllSubjectsResponseEntity>(
          errorMsg: ErrorHandler.getFriendlyMessage(e.toString()));
   }
  }
}
