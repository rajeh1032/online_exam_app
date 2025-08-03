import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class BuildSubjectItem extends StatelessWidget {
  final String subjectName;
   final void Function()? onSubjectTap;

   const BuildSubjectItem({super.key, required this.subjectName, required this.onSubjectTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      onTap: onSubjectTap,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColors.darkWhite, width: 1.5.w),

      ),
      leading: Icon(Icons.book, color: Theme.of(context).colorScheme.primary),
      title: Text(
        subjectName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
