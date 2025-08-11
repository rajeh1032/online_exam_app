import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/verification_code_states.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/view_models/verification_code_view_model.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/handle_state.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/route/app_routes.dart';
import '../widgets/form/verification_code_form.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerificationCodeViewModel>(
        create: (context) => getIt<VerificationCodeViewModel>(),
        child: BlocListener<VerificationCodeViewModel, VerificationCodeStates>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
           handleState(
              context: context,
              status: state.status,
              successMessage: state.response?.status ?? '',
              errorMessage: state.errorMsg ?? '',
              onSuccess: () {
                Navigator.pushReplacementNamed(context, AppRoutes.resetPassword);
              },
            );
          },
          child: const VerificationCodeForm(),
        ));
  }
}
