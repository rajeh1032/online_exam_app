import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/data/datasources/home_remote_data_source.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/data/repositories/home_repositories_impl.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/metadata_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_all_subject_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_all_exam_on_subject_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/request/get_all_exam_on_subject_request_entity.dart';

import 'home_repositories_impl_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSource])
void main() {
  late MockHomeRemoteDataSource mockRemoteDataSource;
  late HomeRepositoriesImpl repository;
  setUpAll(() {
    // Provide dummy values for Mockito
    provideDummy<ApiResult<GetAllSubjectsResponseEntity>>(
      ApiErrorResult<GetAllSubjectsResponseEntity>(errorMsg: 'dummy'),
    );
    provideDummy<ApiResult<GetAllExamOnSubjectEntity>>(
      ApiErrorResult<GetAllExamOnSubjectEntity>(errorMsg: 'dummy'),
    );
  });
  setUp(() {
    mockRemoteDataSource = MockHomeRemoteDataSource();
    repository = HomeRepositoriesImpl(homeRemoteDataSource: mockRemoteDataSource);
  });

  group('getAllSubjects', () {
    test('should return success when data source returns success', () async {
      // Arrange
      const successEntity = GetAllSubjectsResponseEntity(
        message: 'Success',
        metadata: MetadataEntity(currentPage: 1, numberOfPages: 1, limit: 10),
        subjects: [],
      );

      when(mockRemoteDataSource.getAllSubjects())
          .thenAnswer((_) async => ApiSuccessResult(data: successEntity));

      // Act
      final result = await repository.getAllSubjects();

      // Assert
      expect(result, isA<ApiSuccessResult<GetAllSubjectsResponseEntity>>());
      final success = result as ApiSuccessResult;
      expect(success.data.message, 'Success');
    });

    test('should return error when data source returns error', () async {
      // Arrange
      when(mockRemoteDataSource.getAllSubjects())
          .thenAnswer((_) async => ApiErrorResult<GetAllSubjectsResponseEntity>(errorMsg: 'Network Error'));

      // Act
      final result = await repository.getAllSubjects();

      // Assert
      expect(result, isA<ApiErrorResult<GetAllSubjectsResponseEntity>>());
      final error = result as ApiErrorResult;
      expect(error.errorMsg, 'Network Error');
    });
  });

  group('getAllExamOnSubject', () {
    test('should return success when data source returns success', () async {
      // Arrange
      final requestEntity = GetAllExamOnSubjectRequestEntity(subjectId: 'test-subject-id');
      final  successEntity = GetAllExamOnSubjectEntity(
        message: 'Success',
        metadata: const MetadataEntity(currentPage: 1, numberOfPages: 1, limit: 10),
        exams: [],
      );

      when(mockRemoteDataSource.getAllExamOnSubject(requestEntity))
          .thenAnswer((_) async => ApiSuccessResult(data: successEntity));

      // Act
      final result = await repository.getAllExamOnSubject(requestEntity);

      // Assert
      expect(result, isA<ApiSuccessResult<GetAllExamOnSubjectEntity>>());
      final success = result as ApiSuccessResult;
      expect(success.data.message, 'Success');
    });

    test('should return error when data source returns error', () async {
      // Arrange
      final requestEntity = GetAllExamOnSubjectRequestEntity(subjectId: 'test-subject-id');
      when(mockRemoteDataSource.getAllExamOnSubject(requestEntity))
          .thenAnswer((_) async => ApiErrorResult<GetAllExamOnSubjectEntity>(errorMsg: 'Network Error'));

      // Act
      final result = await repository.getAllExamOnSubject(requestEntity);

      // Assert
      expect(result, isA<ApiErrorResult<GetAllExamOnSubjectEntity>>());
      final error = result as ApiErrorResult;
      expect(error.errorMsg, 'Network Error');
    });
  });
}