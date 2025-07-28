import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/reset_password_states.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/view_models/reset_password_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/handle_state.dart';

import '../../../../../core/di/di.dart';
import '../widgets/form/reset_password_form.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordViewModel>(
        create: (context) => getIt<ResetPasswordViewModel>(),
        child: BlocListener<ResetPasswordViewModel, ResetPasswordStates>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            handleState(
              context: context,
              status: state.status,
              successMessage: state.response?.message ?? '',
              errorMessage: state.errorMsg ?? '',
              onError: () {
                Navigator.pop(context);
              },

              onSuccess: () {
             Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            );
          },
          child: const ResetPasswordForm(),
        ));
  }
}
