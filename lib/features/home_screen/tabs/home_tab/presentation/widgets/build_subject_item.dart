import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

class BuildSubjectItem extends StatelessWidget {
  final String subjectName;
  final String subjectIcon;
   final void Function()? onSubjectTap;

   const BuildSubjectItem({super.key, required this.subjectName, required this.onSubjectTap, required this.subjectIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      onTap: onSubjectTap,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColors.darkWhite, width: 1.5.w),

      ),
      // leading:SizedBox(
      //   width: 40.w,
      //   height: 40.h,
      //   child: Image.network(
      //     subjectIcon,
      //     fit: BoxFit.contain,
      //   ),
      // ),
      leading: CachedNetworkImage(
        imageUrl: subjectIcon,
        imageBuilder: (context, imageProvider) => Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error, size: 40.sp),
      ),
      title: Text(
        subjectName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
