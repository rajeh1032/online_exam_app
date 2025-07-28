import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/reset_password_states.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/view_models/reset_password_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_app_bar.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_elevated_button.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_password_field.dart';

import '../../../../../../core/constant/constants.dart';
import '../build_confirm_password_field.dart';
import '../build_title_and_sub.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ResetPasswordViewModel>();
    return Scaffold(
      appBar:const BuildAppBar(title: Constants.passwordLabel),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: AutofillGroup(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    const BuildTitleAndSub(
                      title: Constants.resetPasswordTitle,
                      subTitle: Constants.resetPasswordMessage,
                    ),
                    SizedBox(height: 32.h),
                    BuildPasswordField(controller: viewModel.newPasswordController),
                    SizedBox(height: 24.h),
                    BuildConfirmPasswordField( confirmController: viewModel.confirmPasswordController,passwordController: viewModel.newPasswordController,),
                    SizedBox(height: 48.h),
                    BlocBuilder<ResetPasswordViewModel, ResetPasswordStates>(
                      builder: (context, state) {
                        return BuildElevatedButton(
                          text: Constants.continueString,
                          onPressed: state.isFormValid
                              ? () =>viewModel.resetPassword( email:  viewModel.email)
                              : null,
                        );
                      },
                    ),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
