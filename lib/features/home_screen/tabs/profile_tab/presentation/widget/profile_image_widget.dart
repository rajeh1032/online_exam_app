import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets/app_assets.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../cubit/edit_profile_states.dart';
import '../cubit/edit_profile_view_model.dart';

class ProfileImageWidget extends StatelessWidget {
  final VoidCallback onPickImage;

  const ProfileImageWidget({
    super.key,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileViewModel, EditProfileState>(
      buildWhen: (previous, current) =>
          previous.selectedImagePath != current.selectedImagePath,
      builder: (context, state) {
        String? imagePath = state.selectedImagePath;

        return Center(
          child: Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(180.r),
                  child:  (imagePath != null && File(imagePath).existsSync())
                      ? Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                          gaplessPlayback: true,
                        )
                      : Image.asset(
                          AppAssets.userPhoto,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                bottom: 4.h,
                right: 4.w,
                child: InkWell(
                  onTap: onPickImage,
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.blue[40],
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
