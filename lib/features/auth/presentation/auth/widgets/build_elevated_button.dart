import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildElevatedButton extends StatelessWidget {
  final String text;
 final void Function()? onPressed;
  const BuildElevatedButton ({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed:onPressed,
        child: Text(text),
      ),
    );
  }
}
