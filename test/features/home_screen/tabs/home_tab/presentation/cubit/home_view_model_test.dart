import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/metadata_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/response/get_all_subject_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/entities/subject_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/domain/usecases/get_all_subject_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_state.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_view_model.dart';
import 'home_view_model_test.mocks.dart';

@GenerateMocks([GetAllSubjectUseCase])
void main() {
  late MockGetAllSubjectUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetAllSubjectUseCase();


    provideDummy<ApiResult<GetAllSubjectsResponseEntity>>(
      ApiSuccessResult<GetAllSubjectsResponseEntity>(
        data: const GetAllSubjectsResponseEntity(
          message: '',
          subjects: [],
          metadata: MetadataEntity(currentPage: 1, numberOfPages: 1, limit: 10),
        ),
      ),
    );
  });

  group('HomeViewModel Tests', () {
    blocTest<HomeViewModel, HomeState>(
      'emits [loading, success] when getAllSubjects returns data',
      build: () {
        when(mockUseCase.invoke()).thenAnswer(
              (_) async => ApiSuccessResult(
            data: const GetAllSubjectsResponseEntity(
              message: 'Success',
              subjects: [SubjectEntity(id: '1', name: 'Math', icon: '')],
              metadata:
              MetadataEntity(currentPage: 1, numberOfPages: 1, limit: 10),
            ),
          ),
        );
        return HomeViewModel(getAllSubjectUseCase: mockUseCase);
      },
      act: (viewModel) => viewModel.getAllSubjects(),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        const HomeState(
          status: HomeStatus.success,
          response: GetAllSubjectsResponseEntity(
            message: 'Success',
            subjects: [SubjectEntity(id: '1', name: 'Math', icon: '')],
            metadata:
            MetadataEntity(currentPage: 1, numberOfPages: 1, limit: 10),
          ),
          allSubjects: [SubjectEntity(id: '1', name: 'Math', icon: '')],
          filteredSubjects: [SubjectEntity(id: '1', name: 'Math', icon: '')],
        ),
      ],
    );

    blocTest<HomeViewModel, HomeState>(
      'emits [loading, error] when getAllSubjects fails',
      build: () {
        when(mockUseCase.invoke())
            .thenAnswer((_) async => ApiErrorResult(errorMsg: 'Failed'));
        return HomeViewModel(getAllSubjectUseCase: mockUseCase);
      },
      act: (viewModel) => viewModel.getAllSubjects(),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        const HomeState(status: HomeStatus.error, errorMsg: 'Failed'),
      ],
    );

    blocTest<HomeViewModel, HomeState>(
      'emits filteredSubjects matching query',
      build: () => HomeViewModel(getAllSubjectUseCase: mockUseCase),
      seed: () => const HomeState(
        status: HomeStatus.success,
        allSubjects: [
          SubjectEntity(id: '1', name: 'Math', icon: ''),
          SubjectEntity(id: '2', name: 'Science', icon: ''),
          SubjectEntity(id: '3', name: 'Mathematics', icon: ''),
        ],
        filteredSubjects: [],
      ),
      act: (viewModel) => viewModel.filterSubjects('math'),
      expect: () => [
        const HomeState(
          status: HomeStatus.success,
          allSubjects: [
            SubjectEntity(id: '1', name: 'Math', icon: ''),
            SubjectEntity(id: '2', name: 'Science', icon: ''),
            SubjectEntity(id: '3', name: 'Mathematics', icon: ''),
          ],
          filteredSubjects: [
            SubjectEntity(id: '1', name: 'Math', icon: ''),
            SubjectEntity(id: '3', name: 'Mathematics', icon: ''),
          ],
        ),
      ],
    );

    blocTest<HomeViewModel, HomeState>(
      'emits allSubjects again when query is empty',
      build: () => HomeViewModel(getAllSubjectUseCase: mockUseCase),
      seed: () => const HomeState(
        status: HomeStatus.success,
        allSubjects: [
          SubjectEntity(id: '1', name: 'Math', icon: ''),
          SubjectEntity(id: '2', name: 'Science', icon: ''),
        ],
        filteredSubjects: [],
      ),
      act: (viewModel) => viewModel.filterSubjects(''),
      expect: () => [
        const HomeState(
          status: HomeStatus.success,
          allSubjects: [
            SubjectEntity(id: '1', name: 'Math', icon: ''),
            SubjectEntity(id: '2', name: 'Science', icon: ''),
          ],
          filteredSubjects: [
            SubjectEntity(id: '1', name: 'Math', icon: ''),
            SubjectEntity(id: '2', name: 'Science', icon: ''),
          ],
        ),
      ],
    );
  });
}