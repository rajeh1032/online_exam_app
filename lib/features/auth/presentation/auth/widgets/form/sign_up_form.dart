import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/constants.dart';
import '../../../../../../core/route/app_routes.dart';
import '../../cubit/states/signup_states.dart';
import '../../cubit/view_models/signup_view_model.dart';
import '../../../../../../core/utils/build_app_bar.dart';
import '../build_email_field.dart';
import '../build_first_and_last_name_field.dart';
import '../build_navigation_text.dart';
import '../build_password_and_confirm_field.dart';
import '../build_phone_field.dart';
import '../build_user_name_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignUpViewModel>();
    return
      Scaffold(
      appBar: BuildAppBar(title: Constants.signUpTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: AutofillGroup(
                child: Column(
                  children: [
                    BuildUserNameField(
                      controller: viewModel.signUpUsernameController,
                    ),
                    SizedBox(height: 24.h),
                    BuildFirstAndLastNameField(
                      firstNameController: viewModel.signUpFirstNameController,
                      secondNameController: viewModel.signUpLastNameController,
                    ),
                    SizedBox(height: 24.h),
                    BuildEmailField(
                      controller: viewModel.signUpEmailController,
                    ),
                    SizedBox(height: 24.h),
                    BuildPasswordAndConfirmField(
                        passwordController: viewModel.signUpPasswordController,
                        confirmController:
                            viewModel.signUpRePasswordController),
                    SizedBox(height: 24.h),
                    BuildPhoneField(
                      controller: viewModel.signUpPhoneController,
                    ),
                    SizedBox(height: 48.h),
                    BlocBuilder<SignUpViewModel, SignUpState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                              onPressed: state.isFormValid
                                  ? () => viewModel.signUp()
                                  : null,
                              child: const Text(Constants.signUpTitle)),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    const BuildNavigationText(
                        firstText: Constants.alreadyHaveAccount,
                        secondText: Constants.login,
                        routeName: AppRoutes.login)
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
