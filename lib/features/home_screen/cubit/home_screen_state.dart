abstract class HomeScreenState {}

class HomeInitialState extends HomeScreenState {}

class HomeChangeSelectedIndexState extends HomeScreenState {
  final int selectedIndex;
  HomeChangeSelectedIndexState(this.selectedIndex);
}
