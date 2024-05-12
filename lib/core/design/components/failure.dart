import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:algo_ease/core/design/components/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppFailure extends StatelessWidget {
  const AppFailure({super.key, required this.message, required this.onRetry});

  final String message;
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200.w,
            height: 200.h,
            child: SvgPicture.asset("assets/images/failure_img.svg"),
          ),
          AppText.bodyThreeRegular("Something went wrong!"),
          AppText.captionOneRegular(
            message,
            textAlign: TextAlign.center,
            color: AppColors.subTextColor,
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: 100.w,
            child: AppButton.mediumButton(onTap: onRetry, label: "Retry"),
          ),
        ],
      ),
    );
  }
}
