

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/features/home_screen/cubit/home_screen_state.dart';
import 'package:online_exam_app/features/home_screen/cubit/home_screen_view_model.dart';

void main() {
 group('HomeScreenViewModel Test', (){
  late HomeScreenViewModel viewModel;
  //
  setUp(() {
    viewModel = HomeScreenViewModel();
  });

  tearDown(() {
    viewModel.close();
  });

  test('initial state is correct', () {
   expect(viewModel.state, const HomeScreenState());
  });

  blocTest<HomeScreenViewModel, HomeScreenState>(
   'emits new state when bottomNavOnTap is called with different index',
   build: () => HomeScreenViewModel(),
   act: (cubit) => cubit.bottomNavOnTap(1),
   expect: () => [
    const HomeScreenState(
     status: HomeStatus.indexChanged,
     selectedIndex: 1,
    ),
   ],
  );

  blocTest<HomeScreenViewModel, HomeScreenState>(
   'does not emit new state when tapped on same index',
   build: () => HomeScreenViewModel(),
   seed: () => const HomeScreenState(selectedIndex: 1),
   act: (cubit) => cubit.bottomNavOnTap(1),
   expect: () => [],
  );


 });
}