import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/home_screen/cubit/home_screen_state.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/pages/subject_screen.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/pages/quiz_result_screen.dart';

import '../tabs/profile_tab/presentation/pages/profile_tab.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(HomeInitialState());
  //todo : hold data handle logic
  int selectedIndex = 0;

  List<Widget> bodyList = [
    const SubjectScreen(),
    const QuizResultScreen(),
    ProfileTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(HomeInitialState());
  }
}
