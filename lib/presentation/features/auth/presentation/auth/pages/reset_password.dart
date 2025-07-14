import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/core/utils/validators.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  bool opscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Password',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    "Reset password",
                    style: AppTheme.lightTheme.textTheme.bodyLarge!,
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Password must not be empty and must contain 6 characters with upper case letter and one number at least ",
                      textAlign: TextAlign.center,
                      style: AppTheme.lightTheme.textTheme.headlineLarge!
                          .copyWith(),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    controller: passwordController,
                    obscureText: opscurePassword,
                    maxLines: 1,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(opscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              opscurePassword = !opscurePassword;
                            });
                          }),
                      label: const Text('New password'),
                      hint: const Text('Enter Your Password'),
                    ),
                    validator: AppValidators.validatePassword,
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    obscureText: opscurePassword,
                    maxLines: 1,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(opscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              opscurePassword = !opscurePassword;
                            });
                          }),
                      label: const Text('Confirm password'),
                      hint: const Text('Confirm password'),
                    ),
                    validator: (val) => AppValidators.validateConfirmPassword(
                        val, passwordController.text),
                  ),
                  SizedBox(height: 48.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: const Text('Continue '),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
