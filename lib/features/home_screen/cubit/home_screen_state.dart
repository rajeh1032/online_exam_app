
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, indexChanged }

class HomeScreenState extends Equatable {
  final HomeStatus status;
  final int selectedIndex;

  const HomeScreenState({
    this.status = HomeStatus.initial,
    this.selectedIndex = 0,
  });

  HomeScreenState copyWith({
    HomeStatus? status,
    int? selectedIndex,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [status, selectedIndex];
}