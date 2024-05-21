import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/button.dart';
import 'package:algo_ease/core/design/components/failure.dart';
import 'package:algo_ease/core/design/components/snackbar.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/components/textfield.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/features/auth/bloc/auth_bloc.dart';
import 'package:algo_ease/features/auth/ui/register_page.dart';
import 'package:algo_ease/features/home/ui/home_page.dart';
import 'package:algo_ease/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthBaseState>(
      bloc: locator.get<AuthBloc>(),
      listenWhen: (previous, current) => current is AuthActionState,
      buildWhen: (previous, current) => current is! AuthActionState,
      listener: (context, state) {
        if (state is AuthErrorActionState) {
          AppSnackBar().show(context, state.error, isError: true);
        }
      },
      builder: (context, state) {
        if (state is AuthState) {
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
                  AppText.headingThreeMedium("Login to AlgoEase"),
                  AppText.bodyTwoRegular("Good to see you back!", color: AppColors.subTextColor),
                  SizedBox(height: 38.h),
                  AppText.bodyThreeRegular("Email", color: AppColors.subTextColor),
                  AppTextfield(controller: emailTextController, hintText: "Enter Email"),
                  SizedBox(height: 6.h),
                  AppText.bodyThreeRegular("Password", color: AppColors.subTextColor),
                  AppTextfield(controller: passwordTextController, hintText: "Enter Password"),
                  SizedBox(height: 18.h),
                  AppButton(
                      label: "Login",
                      isLoading: state.isLoading,
                      onTap: () {
                        locator.get<AuthBloc>().add(
                              LoginEvent(
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
                      AppText.captionOneRegular("Don't have a account? ", color: AppColors.subTextColor),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx) => RegisterPage()));
                        },
                        child: AppText.captionOneMedium("Register Now"),
                      ),
                    ],
                  )
                ],
              ),
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
    );
  }
}
