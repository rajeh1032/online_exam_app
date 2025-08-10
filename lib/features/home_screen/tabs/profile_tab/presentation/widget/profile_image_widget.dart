import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/assets/app_assets.dart';

import '../../../../../../core/theme/app_colors.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 81.w,
            height: 81.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180.r),
              image: const DecorationImage(
                image: AssetImage(AppAssets.profileImage),
              ),
            ),
          ),
          Positioned(
            bottom: 4.h,
            right: 4.w,
            child: Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                color: AppColors.blue[40],
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Center(
                child: Icon(Icons.camera_alt_outlined,color: Theme.of(context).colorScheme.onPrimary,)
              ),
            ),
          ),
        ],
      ),
    );
  }
}