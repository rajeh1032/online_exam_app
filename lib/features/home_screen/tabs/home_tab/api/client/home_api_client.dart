import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart'; 
import 'package:online_exam_app/core/api_manger/api_endpoint.dart';
import '../models/response/get_all_subject_response_dto.dart';
import '../models/response/get_exam_questions_response_dto.dart';
part 'home_api_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(ApiEndpoint.getExamQuestions)
  Future<ExamResponseDto> getExamQuestions(@Query("exam") String examId);

  @GET(ApiEndpoint.getAllSubjects)
  Future<GetAllSubjectResponseDto> getAllSubjects();
}
