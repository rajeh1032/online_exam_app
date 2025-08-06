import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/home_screen/cubit/home_screen_view_model.dart';
import '../../../core/assets/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/l10n/translation/app_localizations.dart';
import '../cubit/home_screen_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: viewModel.bodyList[state.selectedIndex],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.selectedIndex,
            onDestinationSelected: viewModel.bottomNavOnTap,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            height: 80.h,
            indicatorColor: AppColors.blue[10],
            destinations: [
              _buildDestination(
                isSelected: state.selectedIndex == 0,
                selectedIcon: AppAssets.selectedHomeIcon,
                unSelectedIcon: AppAssets.unSelectedHomeIcon,
                label: localizations.explore_title,
              ),
              _buildDestination(
                isSelected: state.selectedIndex == 1,
                selectedIcon: AppAssets.selectedResultIcon,
                unSelectedIcon: AppAssets.unSelectedResultIcon,
                label: localizations.result_title,
              ),
              _buildDestination(
                isSelected: state.selectedIndex == 2,
                selectedIcon: AppAssets.selectedProfileIcon,
                unSelectedIcon: AppAssets.unSelectedProfileIcon,
                label: localizations.profile_title,
              ),
            ],
          ),
        );
      },
    );
  }

  NavigationDestination _buildDestination({
    required bool isSelected,
    required String selectedIcon,
    required String unSelectedIcon,
    required String label,
  }) {
    return NavigationDestination(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            unSelectedIcon,
            width: 28.w,
            height: 28.h,
          ),
        ],
      ),
      selectedIcon: Container(
        width: 60.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.blue[10],
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Image.asset(
            selectedIcon,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
      label: label,
    );
  }
}
