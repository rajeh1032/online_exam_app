import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/presentation/features/auth/domain/usecases/verify_reset_code_use_case.dart';
import 'package:online_exam_app/presentation/features/auth/presentation/auth/cubit/states/verification_code_states.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

@injectable
class VerificationCodeViewModel extends Cubit<VerificationCodeStates> {
  VerificationCodeViewModel({required this.verifyResetCodeUseCase})
      : super(VerificationCodeInitialState());

  VerifyResetCodeUseCase verifyResetCodeUseCase;
  TextEditingController pinController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;

  final formKey = GlobalKey<FormState>();

  Future<void> verifyResetCode() async {
    if (formKey.currentState?.validate() == true) {
      emit(VerificationCodeLoadingState());

      final code = pinController.text;
      var either = await verifyResetCodeUseCase.invoke(resetCode: code);
      either.fold(
        (error) => emit(VerificationCodeErrorState(failures: error)),
        (response) => emit(VerificationCodeSuccessState(
            verifyResetCodeResponseEntity: response)),
      );
    }
  }

  @override
  Future<void> close() {
    pinController.dispose();
    errorController.close();

    return super.close();
  }
}
