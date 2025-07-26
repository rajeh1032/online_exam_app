import 'package:flutter/material.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../../core/utils/validators.dart';

class BuildPasswordField extends StatelessWidget {
  final TextEditingController controller;

  const BuildPasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
        labelText: Constants.passwordLabel,
        hintText: Constants.passwordHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: AppValidators.validatePassword,
    );
  }
}
