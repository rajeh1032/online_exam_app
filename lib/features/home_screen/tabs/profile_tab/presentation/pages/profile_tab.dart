import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/route/app_routes.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/utils/custom_elvated_button.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/core/utils/shared_pref_services.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late final sharedPrefService;
  @override
  void initState() {
    super.initState();
    sharedPrefService = getIt<SharedPrefService>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(),
        Text("user Token is :${sharedPrefService.getToken()}" ??
            'no token saved'),
        CustomElvatedButton(
          borderRadius: 12.r,
          backgroundColor: AppColors.red,
          onPressed: () {
            //todo: navigate to login
            showLogoutConfirmationDialog(context);
          },
          text: "Exit",
          textStyle: AppStyles.regular18White.copyWith(color: AppColors.white),
          // svgIcon: AppAssets.exit,
          iconSize: 20.sp,
        ),
      ],
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    DialogUtils.showMessage(
      context: context,
      title: 'Confirm Logout',
      message: 'Are you sure you want to logout?',
      posActionName: 'Yes',
      posAction: () async {
        await sharedPrefService.clearToken();
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      },
      negActionName: 'Cancel',
    );
  }
}
