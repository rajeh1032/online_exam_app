import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/client/home_api_client.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/data_source_impl/home_remote_data_source_impl.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/models/response/get_all_exam_on_subject_response_dto.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/api/models/response/get_all_subject_response_dto.dart';

import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/request/get_all_exam_on_subject_request_entity.dart';

import 'home_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([HomeApiClient])
void main() {
  late MockHomeApiClient mockApiClient;
  late HomeRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockHomeApiClient();
    dataSource = HomeRemoteDataSourceImpl(homeApiClient: mockApiClient);
  });

  group('getAllSubjects', () {
    test('should return success when API call is successful', () async {
      // Arrange
      final fakeResponse = GetAllSubjectResponseDto(
        message: 'Success',
        metadata: null,
        subjects: [],
      );
      when(mockApiClient.getAllSubjects())
          .thenAnswer((_) async => fakeResponse);

      // Act
      final result = await dataSource.getAllSubjects();

      // Assert
      expect(result, isA<ApiSuccessResult>());
      final success = result as ApiSuccessResult;
      expect(success.data.message, 'Success');
    });

    test('should return error when API call throws', () async {
      // Arrange
      when(mockApiClient.getAllSubjects()).thenThrow(Exception('Failed'));

      // Act
      final result = await dataSource.getAllSubjects();

      // Assert
      expect(result, isA<ApiErrorResult>());
      final error = result as ApiErrorResult;
      expect(error.errorMsg, isNotEmpty);
    });
  });

  group('getAllExamOnSubject', () {
    test('should return success when API call is successful', () async {
      // Arrange
      final requestEntity =
          GetAllExamOnSubjectRequestEntity(subjectId: 'test-subject-id');
      final fakeResponse = GetAllExamOnSubjectDto(
        message: 'Success',
        metadata: null,
        exams: [],
      );
      when(mockApiClient.getAllExamOnSubject(requestEntity.subjectId))
          .thenAnswer((_) async => fakeResponse);

      // Act
      final result = await dataSource.getAllExamOnSubject(requestEntity);

      // Assert
      expect(result, isA<ApiSuccessResult>());
      final success = result as ApiSuccessResult;
      expect(success.data.message, 'Success');
    });

    test('should return error when API call throws', () async {
      // Arrange
      final requestEntity =
          GetAllExamOnSubjectRequestEntity(subjectId: 'test-subject-id');
      when(mockApiClient.getAllExamOnSubject(requestEntity.subjectId))
          .thenThrow(Exception('Failed'));

      // Act
      final result = await dataSource.getAllExamOnSubject(requestEntity);

      // Assert
      expect(result, isA<ApiErrorResult>());
      final error = result as ApiErrorResult;
      expect(error.errorMsg, isNotEmpty);
    });
  });
}
