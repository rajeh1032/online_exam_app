import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/errors/localized_error_handler.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../core/route/app_routes.dart';
import '../cubit/states/sign_in_state.dart';
import '../cubit/view_models/sign_in_view_model.dart';
import '../widgets/form/sign_in_form.dart';
import '../widgets/handle_state.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return BlocProvider<SignInViewModel>(
      create: (context) => getIt<SignInViewModel>(),
      child: BlocListener<SignInViewModel, SignInState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          final userName = state.userName ?? state.response?.user.firstName ?? 'jjj';
          if (state.status == SignInStatus.autoAuthenticated) {
            _showAutoAuthenticationDialog(context, local, userName);
            return;
          }
          handleState(
              context: context,
              status: state.status,
              successMessage: state.response?.message ?? '',
              errorMessage: LocalizedErrorHandler.getErrorMessage(
                  context, state.errorMsg),
              onSuccess: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.homeScreen,
                  (route) => false,
                );
              });
        },
        child: const SignInForm(),
      ),
    );
  }

  void _showAutoAuthenticationDialog(
      BuildContext context, AppLocalizations local,String userName) {
    DialogUtils.showMessage(
      context: context,
      title: local.welcome_back,
      message: userName,
      posActionName: local.continue_text,
      negActionName: local.sign_in_again,
      posAction: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.homeScreen,
          (route) => false,
        );
      },
      negAction: () {
        context.read<SignInViewModel>().clearAutoAuthentication();
      },
    );
  }
}
