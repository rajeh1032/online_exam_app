import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/constants.dart';
import '../../../../../../core/utils/validators.dart';
import '../cubit/change_password_states.dart';
import '../cubit/change_password_view_model.dart';
import 'custom_text_form_field.dart';

class BuildChangePasswordForm extends StatelessWidget {
  const BuildChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ChangePasswordViewModel>();
    return Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: Constants.currentPassword,
              hintText: Constants.currentPassword,
              controller: viewModel.currentPasswordController,
              keyboardType: TextInputType.visiblePassword,
              validator: AppValidators.validatePassword,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              label: Constants.newPassword,
              hintText: Constants.newPassword,
              controller: viewModel.newPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: AppValidators.validatePassword,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormField(
              label: Constants.confirmPassword,
              hintText: Constants.confirmPassword,
              controller: viewModel.confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) => AppValidators.validateConfirmPassword(
                  value, viewModel.newPasswordController.text),
            ),
            SizedBox(
              height: 46.h,
            ),
            BlocBuilder<ChangePasswordViewModel, ChangePasswordState>(
              builder: (context, state) {
                return SizedBox(
                  height: 48.h,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: state.isFormValid
                          ? () {
                              viewModel.changePassword();
                            }
                          : null,
                      child: const Text(Constants.update)),
                );
              },
            )
          ],
        ));
  }
}
