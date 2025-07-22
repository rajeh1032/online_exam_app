import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/core/utils/validators.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/forget_password_states.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/view_models/forget_password_view_model.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  ForgetPasswordViewModel viewModel = getIt<ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
      bloc: viewModel,
      listener: (context, state) {
        switch (state) {
          case ForgetPasswordInitialState():
          case ForgetPasswordLoadingState():
            DialogUtils.showLoading(context: context, message: 'Loading...');

          case ForgetPasswordSuccessState():
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: 'OTP Send Successfully',
                title: 'Success',
                posActionName: 'ok',
                posAction: () {
                  //todo: navigate to home screen

                  Navigator.pushNamed(context, AppRoutes.verificationCode);
                });
          case ForgetPasswordErrorState():
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: state.failures.errorMessage,
                title: 'Error',
                posActionName: 'ok');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Password',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SafeArea(
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    "Forget password",
                    style: AppTheme.lightTheme.textTheme.bodyLarge!,
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Please enter your email associated to your account",
                      textAlign: TextAlign.center,
                      style: AppTheme.lightTheme.textTheme.headlineLarge!
                          .copyWith(),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    controller: viewModel.emailController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      hint: Text('Enter Your Email'),
                    ),
                    validator: AppValidators.validateEmail,
                  ),
                  SizedBox(height: 48.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (viewModel.formKey.currentState!.validate()) {
                          viewModel.forgetPassword(context: context);
                        }
                      },
                      child: const Text('Continue '),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
