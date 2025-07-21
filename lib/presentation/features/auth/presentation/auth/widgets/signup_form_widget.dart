import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/constants.dart';
import '../../../../../../core/route/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../../../../../../core/utils/validators.dart';
import '../cubit/signup_states.dart';
import '../cubit/signup_view_model.dart';

class SignupFormWidget extends StatefulWidget {
final SignUpViewModel signUpViewModel;
   const SignupFormWidget ({super.key,required this.signUpViewModel});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.signUpViewModel.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              TextFormField(
                controller: widget.signUpViewModel.signUpUsernameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: Constants.usernameLabel,
                  hintText: Constants.userNameHint,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: AppValidators.validateUsername,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller:
                      widget.signUpViewModel.signUpFirstNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Constants.firstNameLabel,
                        hintText: Constants.firstNameHint,
                        floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                      ),
                      validator: AppValidators.validateUsername,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextFormField(
                      controller:
                      widget.signUpViewModel.signUpLastNameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: Constants.lastNameLabel,
                        hintText: Constants.lastNameHint,
                        floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                      ),
                      validator: AppValidators.validateUsername,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              TextFormField(
                controller: widget.signUpViewModel.signUpEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(

                  labelText: Constants.emailLabel,
                  hintText: Constants.emailHint,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: AppValidators.validateEmail,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller:
                      widget.signUpViewModel.signUpPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: widget.signUpViewModel.obscurePassword,
                      decoration: InputDecoration(
                        labelText: Constants.passwordLabel,
                        hintText: Constants.passwordHint,
                        floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                        suffixIcon: IconButton(
                          icon: Icon(widget.signUpViewModel.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              widget.signUpViewModel.obscurePassword =
                              !widget.signUpViewModel.obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: AppValidators.validatePassword,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextFormField(
                      controller:
                      widget.signUpViewModel.signUpRePasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: widget.signUpViewModel.obscureRePassword,
                      decoration: InputDecoration(
                        labelText: Constants.confirmPasswordLabel,
                        hintText: Constants.confirmPasswordHint,
                        floatingLabelBehavior:
                        FloatingLabelBehavior.always,
                        suffixIcon: IconButton(
                          icon: Icon(widget.signUpViewModel.obscureRePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              widget.signUpViewModel.obscureRePassword =
                              !widget.signUpViewModel.obscureRePassword;
                            });
                          },
                        ),
                      ),
                      validator: (val) =>
                          AppValidators.validateConfirmPassword(
                              val,
                              widget.signUpViewModel
                                  .signUpPasswordController.text),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              TextFormField(
                controller: widget.signUpViewModel.signUpPhoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: Constants.phoneLabel,
                  hintText: Constants.phoneNumberHint,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: AppValidators.validatePhoneNumber,
              ),
              SizedBox(height: 48.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: BlocBuilder<SignUpViewModel, SignUpStates>(
                  bloc: widget.signUpViewModel,
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: widget.signUpViewModel.isFormValid
                              ? AppColors.blue
                              : AppColors.black[40],
                          disabledBackgroundColor: AppColors.black[30],
                          disabledForegroundColor: AppColors.white),

                      onPressed:()=>widget.signUpViewModel.signUp(),
                      // widget.signUpViewModel.isFormValid ? () => widget.signUpViewModel.signUp():null,
                      child: const Text(Constants.signUpButton),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Constants.alreadyHaveAccount,
                      style:
                      AppTheme.lightTheme.textTheme.headlineLarge),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: const Size(0, 0),
                    ),
                    child: Text(
                      Constants.login,
                      style: AppTheme.lightTheme.textTheme.headlineLarge!.copyWith(
                        decoration: TextDecoration.underline,
                        color: AppTheme.lightTheme.colorScheme.primary,
                        decorationColor: AppColors.blue,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
