import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/core/utils/validators.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/cubit/states/auth_state.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/cubit/view_models/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthViewModel viewModel = getIt<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, SignInStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is SignInLoadingState) {
            DialogUtils.showLoading(context: context, message: 'Loading...');
          } else if (state is SignInErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: state.failures.errorMessage,
                title: 'Error',
                posActionName: 'ok');
          } else if (state is SignInSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: 'Login Successfully',
                title: 'Success',
                posActionName: 'ok',
                posAction: () {
                  //todo: save token in shared pref
                  // SharedPreferenceUtils.saveData(
                  //     key: 'token', value: state.loginResponseEntity.token);

                  //todo: navigate to home screen

                  // Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
                });
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Login',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: SafeArea(
            child: Form(
              key: viewModel.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
                    TextFormField(
                      controller: viewModel.emailController,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        hint: Text('Enter Your Email'),
                      ),
                      validator: AppValidators.validateEmail,
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.opscurePassword,
                      maxLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(viewModel.opscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                viewModel.opscurePassword =
                                    !viewModel.opscurePassword;
                              });
                            }),
                        label: const Text('password'),
                        hint: const Text('Enter Your Password'),
                      ),
                      validator: AppValidators.validatePassword,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: viewModel.rememberMe,
                              onChanged: (value) {
                                //todo : Remember Me
                                setState(() {
                                  viewModel.rememberMe = value!;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            Text('Remember me',
                                style: AppTheme
                                    .lightTheme.textTheme.headlineLarge),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            //todo : navigate to forget password
                          },
                          child: Text(
                            'Forget Password?',
                            style: AppTheme.lightTheme.textTheme.headlineLarge!
                                .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.signIn();
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: AppTheme.lightTheme.textTheme.headlineLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            //todo : navigate to register
                          },
                          child: Text(
                            'Sign Up',
                            style: AppTheme.lightTheme.textTheme.headlineLarge!
                                .copyWith(
                              decoration: TextDecoration.underline,
                              color: AppTheme.lightTheme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
