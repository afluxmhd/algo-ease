import 'package:algo_ease/core/dependencies/service_locator.dart';
import 'package:algo_ease/core/design/components/loader.dart';
import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    locator<AuthBloc>().add(FetchUserEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: SvgPicture.asset('assets/images/Vector 1.svg'),
                  ),
                  SizedBox(height: 8.h),
                  AppText.bodyThreeMedium('AlgoEase', color: AppColors.secondaryTextColor),
                  AppText.captionTwoRegular('Turn Your Trading Ideas into Reality', color: AppColors.secondaryTextColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
