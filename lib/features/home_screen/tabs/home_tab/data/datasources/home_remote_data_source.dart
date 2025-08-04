import 'package:online_exam_app/core/api_result/api_result.dart';

import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/request/get_exam_questions_request_Entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_exam_questions_response_entity.dart';

import '../../domain/entities/request/get_all_exam_on_subject_request_entity.dart';
import '../../domain/entities/response/get_all_exam_on_subject_entity.dart';
import '../../domain/entities/response/get_all_subject_response_entity.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<GetExamQuestionsResponseEntity>> getExamQuestions(
      GetExamQuestionsRequestEntity getExamQuestionsRequestEntity);



  Future<ApiResult<GetAllSubjectsResponseEntity>> getAllSubjects();

  Future<ApiResult<GetAllExamOnSubjectEntity>> getAllExamOnSubject(
      GetAllExamOnSubjectRequestEntity getAllExamOnSubjectRequestEntity
      );
}
