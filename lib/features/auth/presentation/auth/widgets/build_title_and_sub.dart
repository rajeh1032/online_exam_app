import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BuildTitleAndSub extends StatelessWidget {
 final String title;
  final String subTitle;
   const BuildTitleAndSub({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return   Column(children: [
      Text(title,
          style: Theme.of(context).textTheme.titleLarge),
      SizedBox(height: 16.h),
      Text(subTitle,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    ],);
  }
}
