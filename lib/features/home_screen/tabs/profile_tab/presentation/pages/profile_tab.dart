import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/utils/custom_elvated_button.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/core/utils/shared_pref_services.dart';

import 'package:online_exam_app/features/home_screen/reusable_widgets/error_state_widget.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/presentation/widget/edit_profile_form.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/presentation/widget/profile_image_widget.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/utils/build_app_bar.dart';
import '../cubit/edit_profile_states.dart';
import '../cubit/edit_profile_view_model.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  final EditProfileViewModel viewModel = getIt<EditProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    final sharedPrefService = getIt<SharedPrefService>();
    return BlocProvider<EditProfileViewModel>(
        create: (context) => viewModel
          ..getUserData()
          ..initializeProfilePhoto(),
        child: BlocListener<EditProfileViewModel, EditProfileState>(
          listenWhen: (previous, current) {
            return previous.status != current.status &&
                (current.hasFormChanged != previous.hasFormChanged);
          },
          listener: (context, state) {
            if (state.status.toString().contains(Constants.success)) {
              return DialogUtils.showMessage(
                  context: context,
                  message: Constants.profileUpdatedSuccessfully,
                  posActionName: Constants.ok);
            } else if (state.status.toString().contains(Constants.error)) {
              return DialogUtils.showMessage(
                  context: context,
                  message: state.errorMsg ?? Constants.unexpectedError,
                  posActionName: Constants.ok);
            } else if (state.status.toString().contains(Constants.loading)) {
              return DialogUtils.showLoading(
                context: context,
                message: Constants.loading,
              );
            }
          },
          child: Scaffold(
            appBar: const BuildAppBar(
              title: Constants.editProfileTitle,
              enableBackButton: false,
              showBackButton: false,
            ),
            body: BlocBuilder<EditProfileViewModel, EditProfileState>(
              builder: (context, state) {
                if (state.status.toString().contains(Constants.error)) {
                  return ErrorStateWidget(
                    message: state.errorMsg ?? Constants.unexpectedError,
                    onRetry: () {
                      viewModel.getUserData();
                    },
                  );
                }

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                         ProfileImageWidget(
                          onPickImage: () {
                            viewModel.pickProfileImage();
                          },),
                        SizedBox(
                          height: 12.h,
                        ),
                        EditProfileForm(
                          onFormChanged: viewModel.onFormChangedHandler,
                        ),
                        SizedBox(
                          height: 12.h,

                        ),
                        CustomElvatedButton(
                          borderRadius: 12.r,
                          backgroundColor: AppColors.red,
                          onPressed: () {
                            //todo: navigate to login
                            showLogoutConfirmationDialog(
                                context, sharedPrefService);
                          },
                          text: "Exit",
                          textStyle: AppStyles.regular18White
                              .copyWith(color: AppColors.white),
                          // svgIcon: AppAssets.exit,
                          iconSize: 20.sp,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }

  void showLogoutConfirmationDialog(
      BuildContext context, SharedPrefService sharedPrefService) {
    DialogUtils.showMessage(
      context: context,
      title: 'Confirm Logout',
      message: 'Are you sure you want to logout?',
      posActionName: 'Yes',
      posAction: () async {
        await sharedPrefService.clearToken();
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      },
      negActionName: 'Cancel',
    );
  }
}
