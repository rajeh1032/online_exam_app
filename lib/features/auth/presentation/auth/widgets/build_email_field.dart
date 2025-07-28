import 'package:flutter/material.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../../core/utils/validators.dart';



class BuildEmailField extends StatelessWidget {
 final TextEditingController controller;
  const BuildEmailField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      decoration: const InputDecoration(
        labelText: Constants.emailLabel,
        hintText: Constants.emailHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: AppValidators.validateEmail,
    );
  }
}
