import 'package:flutter/material.dart';
import 'package:algo_ease/core/design/components/button.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/components/textfield.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80.h, left: 18.w, right: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                "assets/images/Vector 1.svg",
                height: 32.w,
                width: 32.w,
              ),
            ),
            AppText.headingThreeMedium("Welcome to AlgoEase"),
            AppText.bodyTwoRegular("Let's get started", color: AppColors.subTextColor),
            SizedBox(height: 38.h),
            AppText.bodyThreeRegular("Email", color: AppColors.subTextColor),
            AppTextfield(controller: emailTextController, hintText: "Enter Email"),
            SizedBox(height: 6.h),
            AppText.bodyThreeRegular("Password", color: AppColors.subTextColor),
            AppTextfield(controller: passwordTextController, hintText: "Enter Password"),
            SizedBox(height: 6.h),
            AppText.bodyThreeRegular("Confirm Password", color: AppColors.subTextColor),
            AppTextfield(controller: confirmPasswordTextController, hintText: "Confirm Password"),
            SizedBox(height: 18.h),
            AppButton(label: "Register", onTap: () {}),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.captionOneRegular("Already have am account? ", color: AppColors.subTextColor),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppText.captionOneMedium("Login Now"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
