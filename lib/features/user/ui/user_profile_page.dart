import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/button.dart';
import 'package:algo_ease/core/design/components/failure.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/features/auth/bloc/auth_bloc.dart';
import 'package:algo_ease/features/user/bloc/user_bloc.dart';
import 'package:algo_ease/features/user/ui/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: AppText.headingThreeMedium("Profile"),
        ),
        body: BlocConsumer<UserBloc, UserBaseState>(
          listener: (context, state) {},
          bloc: locator.get<UserBloc>()..add(FetchAppUserEvent()),
          builder: (context, state) {
            if (state is UserState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 46.r,
                            backgroundColor: AppColors.buttonColor,
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.headingThreeMedium("Mohammed Aflah"),
                              AppText.captionOneSemiBold("NLP-PATUSR012"),
                              SizedBox(height: 8.h),
                              AppButton.smallButton(
                                width: 100.w,
                                onTap: () {},
                                label: "Edit Profile",
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    AppText.bodyThreeMedium("Contact Information", color: AppColors.subTextColor),
                    SizedBox(height: 8.h),
                    ProfileItem(
                      label: "Email",
                      trailingLabel: state.user.email,
                      iconSvg: "assets/icons/email_icon.svg",
                    ),
                    const ProfileItem(
                      label: "Phone",
                      trailingLabel: "9930055585",
                      iconSvg: "assets/icons/phone_icon.svg",
                    ),
                    const ProfileItem(
                      label: "Address",
                      trailingLabel: "Bengaluru,India",
                      iconSvg: "assets/icons/address_icon.svg",
                    ),
                    SizedBox(height: 8.h),
                    AppText.bodyThreeMedium("General", color: AppColors.subTextColor),
                    SizedBox(height: 16.h),
                    const ProfileItem(
                      label: "Dark Mode",
                      trailingLabel: "aflumogral7@gmail.com",
                      iconSvg: "assets/icons/dark_mode_icon.svg",
                    ),
                    const ProfileItem(
                      label: "Language",
                      trailingLabel: "English",
                      iconSvg: "assets/icons/language_icon.svg",
                    ),
                    ProfileItem(
                      label: "Logout",
                      iconSvg: "assets/icons/logout_icon.svg",
                      onTap: () {
                        locator.get<AuthBloc>().add(LogoutEvent(context: context));
                      },
                    ),
                  ],
                ),
              );
            }
            if (state is UserFailureState) {
              return AppFailure(message: state.message, onRetry: () {});
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
