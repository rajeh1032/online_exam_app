import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/presentation/cubit/edit_profile_states.dart';

import '../../../../../../core/constant/constants.dart';
import '../../../../../auth/presentation/auth/widgets/build_email_field.dart';
import '../../../../../auth/presentation/auth/widgets/build_first_and_last_name_field.dart';
import '../../../../../auth/presentation/auth/widgets/build_phone_field.dart';
import '../../../../../auth/presentation/auth/widgets/build_user_name_field.dart';
import '../cubit/edit_profile_view_model.dart';

class EditProfileForm extends StatelessWidget {
  final VoidCallback? onFormChanged;

  const EditProfileForm({
    super.key,
    this.onFormChanged,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<EditProfileViewModel>();

    return Form(
      key: viewModel.formKey,
      onChanged: onFormChanged,
      child: AutofillGroup(
        child: Column(
          children: [
            BuildUserNameField(
              controller: viewModel.userNameController,
            ),
            SizedBox(height: 12.h),
            BuildFirstAndLastNameField(
              firstNameController: viewModel.firstNameController,
              secondNameController: viewModel.lastNameController,
            ),
            SizedBox(height: 12.h),
            BuildEmailField(
              controller: viewModel.emailController,
            ),
            SizedBox(height: 12.h),
            _BuildPasswordField(),
            SizedBox(height: 12.h),
            BuildPhoneField(
              controller: viewModel.phoneNumberController,
            ),
            SizedBox(height: 24.h),
            BlocBuilder<EditProfileViewModel, EditProfileState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                      onPressed: state.isFormValid && state.hasFormChanged
                          ? () => viewModel.editProfile()
                          : null,
                      child: const Text(Constants.update)),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _BuildPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "••••••••",
      readOnly: true,
      obscureText: true,
      decoration: InputDecoration(
        labelText: Constants.passwordLabel,
        hintText: Constants.passwordHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.changePassword);
          },
          child: Text(
            Constants.change,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
