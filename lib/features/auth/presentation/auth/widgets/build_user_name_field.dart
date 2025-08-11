import 'package:flutter/material.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../../core/utils/validators.dart';

class BuildUserNameField extends StatelessWidget {
  final TextEditingController controller;

  const BuildUserNameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.name],
      decoration: const InputDecoration(
        labelText: Constants.usernameLabel,
        hintText: Constants.userNameHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: AppValidators.validateUsername,
    );
  }
}
