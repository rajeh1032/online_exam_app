import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../../core/utils/validators.dart';


class BuildFirstAndLastNameField extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController secondNameController;

  const BuildFirstAndLastNameField(
      {super.key,
      required this.firstNameController,
      required this.secondNameController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: firstNameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.name],
          decoration: const InputDecoration(
            labelText: Constants.firstNameLabel,
            hintText: Constants.firstNameHint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: AppValidators.validateFullName,
        )),
        SizedBox(width: 8.w),
        Expanded(
            child: TextFormField(
          controller: secondNameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.name],
          decoration: const InputDecoration(
            labelText: Constants.lastNameLabel,
            hintText: Constants.lastNameHint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: AppValidators.validateFullName,
        )),
      ],
    );
  }
}
