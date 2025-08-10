import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/presentation/cubit/change_password_states.dart';

import '../../../../../../core/constant/constants.dart';
import '../../../../../auth/presentation/auth/widgets/handle_state.dart';
import '../cubit/change_password_view_model.dart';
import '../widget/build_change_password_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final ChangePasswordViewModel viewModel = getIt<ChangePasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordViewModel>(
      create: (context) => viewModel,
      child: BlocListener<ChangePasswordViewModel, ChangePasswordState>(
        listenWhen: (previous, current) {
          return previous.status != current.status;
        },
        listener: (context, state) {
          handleState(
            context: context,
            status: state.status,
            successMessage: state.response?.message ??
                Constants.passwordChangedSuccessfully,
            errorMessage: state.errorMsg ?? Constants.unexpectedError,
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(Constants.changePassword),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                 const BuildChangePasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
