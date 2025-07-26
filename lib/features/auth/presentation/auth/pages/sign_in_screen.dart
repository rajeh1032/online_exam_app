import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di.dart';
import '../cubit/states/sign_in_state.dart';
import '../cubit/view_models/sign_in_view_model.dart';
import '../widgets/form/sign_in_form.dart';
import '../widgets/handle_state.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInViewModel>(
      create: (context) => getIt<SignInViewModel>(),
      child: BlocListener<SignInViewModel, SignInState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            handleState(
                context: context,
                status: state.status,
                successMessage: state.response?.message ?? '',
                errorMessage: state.errorMsg ?? '',
                );
          },
          child: const SignInForm()),
    );
  }
}
