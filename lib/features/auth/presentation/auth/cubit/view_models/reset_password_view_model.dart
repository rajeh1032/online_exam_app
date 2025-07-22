import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/provider/user_provider.dart';
import 'package:online_exam_app/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/auth/cubit/states/reset_password_states.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  ResetPasswordViewModel({required this.resetPasswordUseCase})
      : super(ResetPasswordInitialState());

  ResetPasswordUseCase resetPasswordUseCase;

  final formKey = GlobalKey<FormState>();
  String? userEmail;

  final TextEditingController passwordController = TextEditingController();
  Future<void> resetPassword({required BuildContext context}) async {
    userEmail = context.read<UserProvider>().email;
    if (formKey.currentState?.validate() == true) {
      emit(ResetPasswordLoadingState());
      var either = await resetPasswordUseCase.invoke(
          email: userEmail, newPassword: passwordController.text);
      either.fold(
        (error) => emit(ResetPasswordErrorState(failures: error)),
        (response) => emit(
            ResetPasswordSuccessState(resetPasswordResponseEntity: response)),
      );
    }
  }
}
