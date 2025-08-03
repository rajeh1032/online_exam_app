import 'package:equatable/equatable.dart';

import '../../domain/entities/response/get_all_subject_response_entity.dart';
import '../../domain/entities/subject_entity.dart';

enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final GetAllSubjectsResponseEntity? response;
  final String? errorMsg;
  final HomeStatus status;
  final List<SubjectEntity> allSubjects;
  final List<SubjectEntity> filteredSubjects;

  const HomeState({
    this.response,
    this.errorMsg,
    this.status = HomeStatus.initial,
    this.allSubjects = const [],
    this.filteredSubjects = const [],
  });

  HomeState copyWith({
    GetAllSubjectsResponseEntity? response,
    String? errorMsg,
    HomeStatus? status,
    List<SubjectEntity>? allSubjects,
    List<SubjectEntity>? filteredSubjects,
  }) {
    return HomeState(
      response: response ?? this.response,
      errorMsg: errorMsg ?? this.errorMsg,
      status: status ?? this.status,
      allSubjects: allSubjects ?? this.allSubjects,
      filteredSubjects: filteredSubjects ?? this.filteredSubjects,
    );
  }

  @override
  List<Object?> get props => [
        response,
        errorMsg,
        status,
        allSubjects,
        filteredSubjects,
      ];
}
