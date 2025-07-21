import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/provider/user_provider.dart';
import 'package:online_exam_app/presentation/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/cubit/states/forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordViewModel({required this.forgetPasswordUseCase})
      : super(ForgetPasswordInitialState());

  ForgetPasswordUseCase forgetPasswordUseCase;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  Future<void> forgetPassword({required BuildContext context}) async {
    if (formKey.currentState?.validate() == true) {
      emit(ForgetPasswordLoadingState());

      var either = await forgetPasswordUseCase.invoke(
        email: emailController.text,
      );

      context.read<UserProvider>().updateUser(emailController.text);
      either.fold(
        (error) => emit(ForgetPasswordErrorState(failures: error)),
        (response) => emit(
            ForgetPasswordSuccessState(forgetPasswordResponseEntity: response)),
      );
    }
  }
}
