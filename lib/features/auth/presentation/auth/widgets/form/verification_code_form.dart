import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:online_exam_app/features/auth/presentation/auth/cubit/view_models/verification_code_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_pin_code.dart';

import '../../../../../../core/constant/constants.dart';
import '../../../../../../core/utils/dialog_utils.dart';
import '../../cubit/view_models/forget_password_view_model.dart';
import '../build_title_and_sub.dart';

class VerificationCodeForm extends StatefulWidget {
  const VerificationCodeForm({super.key});

  @override
  State<VerificationCodeForm> createState() => _VerificationCodeFormState();
}

class _VerificationCodeFormState extends State<VerificationCodeForm> {
  late final VerificationCodeViewModel viewModel;
  late final ForgetPasswordViewModel forgetPasswordVM;
  @override
  Widget build(BuildContext context) {
     viewModel = context.read<VerificationCodeViewModel>();
     forgetPasswordVM = context.read<ForgetPasswordViewModel>();
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
                      title: Constants.emailVerificationTitle,
                      subTitle: Constants.emailVerificationMessage,
                    ),
                    SizedBox(height: 32.h),
                    BuildPinCode(
                      controller: viewModel.codeController,
                      onCompleted: (String value) {
                        viewModel.verifyCode();
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Constants.didntReceiveCode,
                            style: Theme.of(context).textTheme.headlineLarge),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: const Size(0, 0),
                          ),
                          onPressed: () async {
                            final email = await viewModel.email;
                            if (!context.mounted) return;
                            if (email != null && email.isNotEmpty) {
                              await forgetPasswordVM.resendCode( email);
                            } else {
                              DialogUtils.showMessage(
                                context: context,
                                message: Constants.emailNotFoundError,
                              );
                            }
                          },
                          child: Text(
                            Constants.resendCode,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  color: Theme.of(context).colorScheme.primary,
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
        ),
      ),
    );
  }
}
