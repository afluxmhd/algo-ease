import 'package:algo_ease/core/design/components/text.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.label,
    required this.iconSvg,
    this.trailingLabel,
    this.onTap,
  });
  final String label;
  final String iconSvg;
  final String? trailingLabel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  iconSvg,
                  height: 18.w,
                ),
                SizedBox(width: 10.h),
                AppText.bodyTwoRegular(label, color: label == "Logout" ? AppColors.errorColor : AppColors.secondaryTextColor),
              ],
            ),
            if (trailingLabel != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText.captionOneRegular(trailingLabel!, color: AppColors.subTextColor),
                  SizedBox(width: 10.h),
                  SvgPicture.asset(
                    "assets/icons/forward_arrow_icon.svg",
                    height: 18.w,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
