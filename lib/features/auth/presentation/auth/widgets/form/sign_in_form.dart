import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/constants.dart';
import '../../../../../../core/route/app_routes.dart';
import '../../cubit/states/sign_in_state.dart';

import '../../cubit/view_models/sign_in_view_model.dart';
import '../../../../../../core/utils/build_app_bar.dart';
import '../build_elevated_button.dart';
import '../build_email_field.dart';
import '../build_navigation_text.dart';
import '../build_password_field.dart';
import '../build_remember_me.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignInViewModel>();
    return Scaffold(
      appBar: const BuildAppBar(
        title: Constants.login,
        showBackButton: false,
        enableBackButton: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: AutofillGroup(
                child: Column(
                  children: [
                    BuildEmailField(
                      controller: viewModel.signInEmailController,
                    ),
                    SizedBox(height: 24.h),
                    BuildPasswordField(
                        controller: viewModel.signInPasswordController),
                    SizedBox(height: 16.h),
                    BlocBuilder<SignInViewModel, SignInState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildRememberMe(
                              onPressed: () {
                                viewModel.toggleRememberMe(!state.rememberMe);
                              },
                              value: state.rememberMe,
                              onChanged: (bool? newValue) {
                                viewModel.toggleRememberMe(newValue ?? false);
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.forgetPassword);
                              },
                              child: Text(
                                Constants.forgetPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    BlocBuilder<SignInViewModel, SignInState>(
                      builder: (context, state) {
                        return BuildElevatedButton(
                          text: Constants.login,
                          onPressed: () {
                            if (state.isFormValid) {
                              viewModel.signIn();
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    const BuildNavigationText(
                        firstText: Constants.doNotHaveAccount,
                        secondText: Constants.signUpTitle,
                        routeName: AppRoutes.signup)
                  ],
                ),
              ),
            )),
      )),
    );
  }
}
