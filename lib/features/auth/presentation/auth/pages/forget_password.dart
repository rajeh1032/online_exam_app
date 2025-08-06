import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/forget_password_states.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/view_models/forget_password_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/auth/pages/verification_code.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/handle_state.dart';

import '../../../../../core/errors/localized_error_handler.dart';
import '../widgets/form/forget_password_form.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordViewModel>(
        create: (context) => getIt<ForgetPasswordViewModel>(),
        child: BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            handleState(
              context: context,
              status: state.status,
              successMessage: state.response?.info ?? '',
              errorMessage: LocalizedErrorHandler.getErrorMessage(context, state.errorMsg),
              onSuccess: ()  {
                final forgetVM = context.read<ForgetPasswordViewModel>();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: forgetVM,
                      child: const VerificationCode(),
                    ),
                  ),
                );
              }
            );
          },
          child: const ForgetPasswordForm(),
        ));
  }
}
