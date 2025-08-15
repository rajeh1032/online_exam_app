import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/forget_password_states.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/view_models/forget_password_view_model.dart';

import '../../../../../../core/constant/constants.dart';
import '../build_email_field.dart';
import '../build_title_and_sub.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.passwordLabel),
        centerTitle: false,
      ),
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
                      title: Constants.forgetPasswordTitle,
                      subTitle: Constants.forgetPasswordMessage,
                    ),
                    SizedBox(height: 32.h),
                    BuildEmailField(
                      controller: viewModel.emailController,
                    ),
                    SizedBox(height: 48.h),
                    BlocBuilder<ForgetPasswordViewModel, ForgetPasswordStates>(
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                              onPressed: state.isFormValid
                                  ? () => viewModel.forgetPassword()
                                  : null,
                              child: const Text(Constants.continueString)),
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
