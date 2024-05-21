import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/failure.dart';
import 'package:algo_ease/features/auth/bloc/auth_bloc.dart';
import 'package:algo_ease/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:algo_ease/core/design/components/button.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/components/textfield.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthBaseState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthState) {
            return SingleChildScrollView(
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
                  AppButton(
                      label: "Register",
                      isLoading: state.isLoading,
                      onTap: () {
                        locator.get<AuthBloc>().add(
                              RegisterEvent(
                                  auth: AppUser(
                                    email: emailTextController.text.trim(),
                                    password: emailTextController.text.trim(),
                                  ),
                                  context: context),
                            );
                      }),
                  SizedBox(height: 28.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.captionOneRegular("Already have an account? ", color: AppColors.subTextColor),
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
            );
          }
          if (state is AuthFailureState) {
            return AppFailure(
                message: state.message,
                onRetry: () {
                  locator.get<AuthBloc>().add(FetchUserEvent(context: context));
                });
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
