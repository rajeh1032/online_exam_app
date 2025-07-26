import 'package:flutter/material.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../../core/utils/validators.dart';



class BuildPhoneField extends StatelessWidget {
  final TextEditingController controller;
  const BuildPhoneField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.telephoneNumber],
      decoration: const InputDecoration(
        labelText: Constants.phoneLabel,
        hintText: Constants.phoneNumberHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: AppValidators.validatePhoneNumber,
    );
  }
}
