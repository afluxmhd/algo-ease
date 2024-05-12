import 'package:algo_ease/core/design/components/loader.dart';
import 'package:algo_ease/core/design/shared/colors.dart';
import 'package:algo_ease/core/design/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    this.width = double.infinity,
    required this.label,
    this.onTap,
    this.height = 42,
    this.margin,
    this.isLoading = false,
    this.textStyle,
  });

  final double width;
  final double height;
  final String label;

  final Function()? onTap;
  final EdgeInsets? margin;
  final bool isLoading;
  final TextStyle? textStyle;

  AppButton.mainButton({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
    this.width = double.infinity,
  })  : margin = const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        height = 42,
        textStyle = body3MediumStyle;

  AppButton.mediumButton({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
    this.width = double.infinity,
  })  : margin = null,
        height = 34,
        textStyle = body3MediumStyle;

  AppButton.smallButton({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
    this.width = double.infinity,
  })  : margin = null,
        height = 28,
        textStyle = caption1MediumStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.buttonColor,
        ),
        child: Center(
          child: isLoading
              ? const AppLoader(size: 18, color: AppColors.primaryTextColor)
              : Text(
                  label,
                  style: textStyle,
                ),
        ),
      ),
    );
  }
}
