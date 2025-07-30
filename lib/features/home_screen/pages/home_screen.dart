import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/home_screen/cubit/home_screen_view_model.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../cubit/home_screen_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: viewModel.bodyList[state.selectedIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: viewModel.bottomNavOnTap,
            currentIndex: state.selectedIndex,
            items: [
              _bottomNavBarItemBuilder(
                isSelected: state.selectedIndex == 0,
                selectedIcon: AppAssets.selectedHomeIcon,
                unSelectedIcon: AppAssets.unSelectedHomeIcon,
                label: Constants.exploreTitle,
              ),
              _bottomNavBarItemBuilder(
                isSelected: state.selectedIndex == 1,
                selectedIcon: AppAssets.selectedResultIcon,
                unSelectedIcon: AppAssets.unSelectedResultIcon,
                label: Constants.resultTitle,
              ),
              _bottomNavBarItemBuilder(
                isSelected: state.selectedIndex == 2,
                selectedIcon: AppAssets.selectedProfileIcon,
                unSelectedIcon: AppAssets.unSelectedProfileIcon,
                label: Constants.profileTitle,
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavBarItemBuilder(
      {required bool isSelected,
      required String selectedIcon,
      required String unSelectedIcon,
      required String label}) {
    return BottomNavigationBarItem(
        icon: Container(
          width: 60.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: isSelected ? AppColors.blue[10] : AppColors.transparentColor,
          ),
          child: Center(
              child: Image.asset(
            isSelected ? selectedIcon : unSelectedIcon,
          )),
        ),
        label: label);
  }
}
