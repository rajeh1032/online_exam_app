import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/core/utils/validators.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/verification_code_states.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/view_models/verification_code_view_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCode();
}

class _VerificationCode extends State<VerificationCode> {
  VerificationCodeViewModel viewModel = getIt.get<VerificationCodeViewModel>();

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    viewModel.errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<VerificationCodeViewModel, VerificationCodeStates>(
        listener: (context, state) {
          switch (state) {
            case VerificationCodeInitialState():
            case VerificationCodeLoadingState():
              DialogUtils.showLoading(context: context, message: "Loading...");
            case VerificationCodeSuccessState():
              {
                DialogUtils.hideLoading(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: AppColors.green,
                  content: Text("Code verified successfully ✅"),
                ));
                //todo: navigate to reset password screen
                Navigator.pushNamed(context, AppRoutes.resetPassword);
              }

            case VerificationCodeErrorState():
              {
                DialogUtils.hideLoading(context);
                setState(() {
                  hasError = true;
                });
                Future.delayed(const Duration(milliseconds: 100), () {
                  viewModel.errorController.add(ErrorAnimationType.shake);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: AppColors.red,
                      content: Text("❌ ${state.failures.errorMessage}")),
                );
              }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: SafeArea(
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
                    Form(
                      key: viewModel.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: PinCodeTextField(
                          appContext: context,
                          length: 6,
                          controller: viewModel.pinController,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          validator: AppValidators.pinCodeValidator,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: 50.h,
                            fieldWidth: 40.w,
                            activeFillColor: hasError
                                ? AppColors.blue[10]
                                : AppColors.blue[10],
                            selectedFillColor: AppColors.blue[10],
                            inactiveFillColor: AppColors.blue[10],
                            activeColor: Colors.transparent,
                            selectedColor: Colors.transparent,
                            inactiveColor: Colors.transparent,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          errorAnimationController: viewModel.errorController,
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {
                            setState(() => currentText = v);
                            viewModel.verifyResetCode();
                          },
                          onChanged: (value) {
                            setState(() => currentText = value);
                          },
                          beforeTextPaste: (text) => true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        hasError
                            ? "*Please fill up all the cells properly"
                            : "",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
