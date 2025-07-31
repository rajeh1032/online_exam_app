import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class BuildElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  Color? backgroundColor = AppColors.blue;
  Color? textColor = AppColors.white;
  BorderRadius? borderRadius = BorderRadius.circular(12.r);
  BuildElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius!,
                side: const BorderSide(color: AppColors.blue, width: 2))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
