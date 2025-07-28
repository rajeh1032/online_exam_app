import 'package:flutter/material.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../../core/utils/validators.dart';

class  BuildConfirmPasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmController;
  const  BuildConfirmPasswordField({super.key, required this.confirmController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: confirmController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.password],
      decoration: const InputDecoration(
        labelText: Constants.confirmPasswordLabel,
        hintText: Constants.confirmPasswordHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (val) => AppValidators.validateConfirmPassword(
          val, passwordController.text),
    );
  }
}
