import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/assets/app_assets.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/features/home_screen/cubit/home_screen_state.dart';
import 'package:online_exam_app/features/home_screen/cubit/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          // appBar:
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: viewModel.bodyList[viewModel.selectedIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: AppColors.darkWhite),
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: true,
                    selectedItemColor: AppColors.blue,
                    unselectedItemColor: AppColors.black[30],
                    elevation: 0,
                    currentIndex: viewModel.selectedIndex,
                    onTap: viewModel.bottomNavOnTap,
                    iconSize: 24.sp,
                    items: [
                      _bottomNavBarItemBuilder(
                        isSelected: viewModel.selectedIndex == 0,
                        selectedIcon: AppAssets.selectedHomeIcon,
                        unSelectedIcon: AppAssets.unSelectedHomeIcon,
                        label: "Home",
                      ),
                      _bottomNavBarItemBuilder(
                        isSelected: viewModel.selectedIndex == 1,
                        selectedIcon: AppAssets.selectedResultIcon,
                        unSelectedIcon: AppAssets.unSelectedResultIcon,
                        label: "Result",
                      ),
                      _bottomNavBarItemBuilder(
                        isSelected: viewModel.selectedIndex == 2,
                        selectedIcon: AppAssets.selectedProfileIcon,
                        unSelectedIcon: AppAssets.unSelectedProfileIcon,
                        label: "Result",
                      ),
                    ])),
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
        icon: CircleAvatar(
          backgroundColor:
              isSelected ? AppColors.blue[10] : AppColors.transparentColor,
          radius: 25.r,
          child: Image.asset(isSelected ? selectedIcon : unSelectedIcon),
        ),
        label: label);
  }
}
