import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/exam_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_all_exam_on_subject_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/usecases/get_all_exam_on_subject_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exams_by_subject_cubit/exams_by_subject_state.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/exams_by_subject_cubit/exams_by_subject_view_model.dart';

import 'exams_by_subject_view_model_test.mocks.dart';

@GenerateMocks([GetAllExamOnSubjectUseCase])
void main() {
  late MockGetAllExamOnSubjectUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetAllExamOnSubjectUseCase();

    // Provide dummy for complex generic types
    provideDummy<ApiResult<GetAllExamOnSubjectEntity>>(
      ApiSuccessResult<GetAllExamOnSubjectEntity>(
        data: GetAllExamOnSubjectEntity(exams: []),
      ),
    );
  });

  group('ExamsBySubjectViewModel Tests', () {
    const String testSubjectId = 'subject_123';

    final List<ExamEntity> mockExams = [
      ExamEntity(
        id: 'exam_1',
        title: 'Math Exam 1',
        duration: 60,
        numberOfQuestions: 20,
      ),
      ExamEntity(
        id: 'exam_2',
        title: 'Math Exam 2',
        duration: 90,
        numberOfQuestions: 30,
      ),
    ];

    blocTest<ExamsBySubjectViewModel, ExamsBySubjectState>(
      'emits [loading, success] when getExamsBySubject returns data',
      build: () {
        when(mockUseCase.invoke(any)).thenAnswer(
              (_) async => ApiSuccessResult(
            data: GetAllExamOnSubjectEntity(exams: mockExams),
          ),
        );
        return ExamsBySubjectViewModel(getAllExamOnSubjectUseCase: mockUseCase);
      },
      act: (viewModel) => viewModel.getExamsBySubject(testSubjectId),
      expect: () => [
        const ExamsBySubjectState(status: ExamsBySubjectStatus.loading),
        ExamsBySubjectState(
          status: ExamsBySubjectStatus.success,
          exams: mockExams,
        ),
      ],
    );

    blocTest<ExamsBySubjectViewModel, ExamsBySubjectState>(
      'emits [loading, success] with empty list when getExamsBySubject returns null exams',
      build: () {
        when(mockUseCase.invoke(any)).thenAnswer(
              (_) async => ApiSuccessResult(
            data: GetAllExamOnSubjectEntity(exams: null),
          ),
        );
        return ExamsBySubjectViewModel(getAllExamOnSubjectUseCase: mockUseCase);
      },
      act: (viewModel) => viewModel.getExamsBySubject(testSubjectId),
      expect: () => [
        const ExamsBySubjectState(status: ExamsBySubjectStatus.loading),
        const ExamsBySubjectState(
          status: ExamsBySubjectStatus.success,
          exams: [],
        ),
      ],
    );

    blocTest<ExamsBySubjectViewModel, ExamsBySubjectState>(
      'emits [loading, error] when getExamsBySubject fails',
      build: () {
        when(mockUseCase.invoke(any)).thenAnswer(
              (_) async => ApiErrorResult(errorMsg: 'Network error occurred'),
        );
        return ExamsBySubjectViewModel(getAllExamOnSubjectUseCase: mockUseCase);
      },
      act: (viewModel) => viewModel.getExamsBySubject(testSubjectId),
      expect: () => [
        const ExamsBySubjectState(status: ExamsBySubjectStatus.loading),
        const ExamsBySubjectState(
          status: ExamsBySubjectStatus.error,
          errorMsg: 'Network error occurred',
        ),
      ],
    );
  });
}