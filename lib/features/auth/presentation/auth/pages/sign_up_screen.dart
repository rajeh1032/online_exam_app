
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/handle_state.dart';

import '../../../../../core/di/di.dart';
import '../cubit/states/signup_states.dart';

import '../cubit/view_models/signup_view_model.dart';
import '../widgets/form/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpViewModel>(
      create: (context) => getIt<SignUpViewModel>(),
      child: BlocListener<SignUpViewModel, SignUpState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          handleState(
              context: context,
              status: state.status,
              successMessage: Constants.signUpSuccessfully,
              errorMessage: state.errorMsg ?? '');
        },
        child: const SignUpForm(),
      ),
    );
  }
}
