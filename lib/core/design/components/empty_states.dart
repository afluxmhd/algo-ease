import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({super.key, required this.message, required this.svgPath, required this.subMessage});

  final String message;
  final String subMessage;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200.w,
            height: 200.h,
            child: SvgPicture.asset(svgPath),
          ),
          AppText.bodyTwoMedium(
            message,
            textAlign: TextAlign.center,
          ),
          AppText.captionOneRegular(
            subMessage,
            textAlign: TextAlign.center,
            color: AppColors.subTextColor,
          ),
        ],
      ),
    );
  }
}
