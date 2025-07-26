import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/constants.dart';



class BuildRememberMe extends StatelessWidget {
  final bool value;
  final void Function()? onPressed;
  final void Function(bool?)? onChanged;

  const BuildRememberMe(
      {super.key,
      required this.onPressed,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        Text(Constants.rememberMe,
            style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}
