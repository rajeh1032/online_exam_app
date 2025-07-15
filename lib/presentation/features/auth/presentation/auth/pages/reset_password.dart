import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/core/utils/validators.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/cubit/states/reset_password_states.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/cubit/view_models/reset_password_view_model.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool opscurePassword = true;

  ResetPasswordViewModel viewModel = getIt.get<ResetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ResetPasswordViewModel, ResetPasswordStates>(
        listener: (context, state) {
          switch (state) {
            case ResetPasswordInitialState():
            case ResetPasswordLoadingState():
              {
                DialogUtils.showLoading(
                    context: context, message: 'Loading...');
              }
            case ResetPasswordSuccessState():
              {
                DialogUtils.hideLoading(context);
                DialogUtils.showMessage(
                    context: context,
                    message: 'Password Reset Successfully',
                    title: 'Success',
                    posActionName: 'ok',
                    posAction: () {
                      //todo: navigate to login screen

                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    });
              }
            case ResetPasswordErrorState():
              {
                DialogUtils.hideLoading(context);
                DialogUtils.showMessage(
                    context: context,
                    message: state.failures.errorMessage,
                    title: 'Error',
                    posActionName: 'ok');
              }
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.h),
                      Text(
                        "Reset password",
                        style: AppTheme.lightTheme.textTheme.bodyLarge!,
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Password must not be empty and must contain 6 characters with upper case letter and one number at least ",
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
                        controller: viewModel.passwordController,
                        obscureText: opscurePassword,
                        maxLines: 1,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(opscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  opscurePassword = !opscurePassword;
                                });
                              }),
                          label: const Text('New password'),
                          hint: const Text('Enter Your Password'),
                        ),
                        validator: AppValidators.validatePassword,
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        obscureText: opscurePassword,
                        maxLines: 1,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(opscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  opscurePassword = !opscurePassword;
                                });
                              }),
                          label: const Text('Confirm password'),
                          hint: const Text('Confirm password'),
                        ),
                        validator: (val) =>
                            AppValidators.validateConfirmPassword(
                                val, viewModel.passwordController.text),
                      ),
                      SizedBox(height: 48.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.resetPassword(context: context);
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
        ),
      ),
    );
  }
}
